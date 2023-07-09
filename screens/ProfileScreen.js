import React, { useContext, useEffect, useState } from "react";
import { StyleSheet, Text, View, Modal, Image, TextInput } from "react-native";
import { TouchableOpacity } from "react-native";
import { auth, db } from "../firebase";
import { updatePassword, reauthenticateWithCredential, EmailAuthProvider } from 'firebase/auth';	
import { useNavigation } from "@react-navigation/native";
import { UserContext } from "../context/UserContext";
import close from "../assets/icons/close.png";
import { Formik } from "formik";
import {doc, getDoc } from "firebase/firestore/lite";
import * as yup from "yup";
import * as Animatable from 'react-native-animatable';
import { showMessage } from "react-native-flash-message";



const ProfileScreen = ({ navigatio }) => {
  const navigation = useNavigation();
  const { setIsAuthent } = useContext(UserContext);
  const [viewModal, setViewModal] = useState(false);
  const [password, setPassword] = useState("");
  const [confPass, setConfPass] = useState("");
  const [newPassword, setNewPassword] = useState("");
  const [dataUser,setDataUser] = useState("");

  // Obtener datos del usuario
  const getDataUser = async () => {
    const docRef = doc(db, "users", auth.currentUser.uid);
    const docSnap = await getDoc(docRef);
    const data = docSnap.data();
    setDataUser(data);
    console.log(dataUser);
  }


  // Cerrar Sesion
  const handleSignup = () => {
    auth
      .signOut()
      .then(() => {
        setIsAuthent(false);
        showMessage({
          message: "Sesión cerrada con éxito",
          description: "La sesión se ha cerrado con éxito",
          type: "success",
          icon: "success",
        });
      })
      .catch((error) => alert(error.message));
  };

// VALIDACION DEL FORMULARIO
  const validationSchema = yup.object().shape({
    newPass: yup
      .string()
      .required("La nueva contraseña es requerida")
      .min(
        6,
        ({ min }) => `La contraseña debe tener al menos ${min} caracteres`
      ),
    password: yup
      .string()
      .required("La contraseña anterior es requerida")
      .min(
        6,
        ({ min }) => `La contraseña debe tener al menos ${min} caracteres`
      ),
      confirmPass: yup
      .string()
      .required("La nueva contraseña es requerida")
      .min(
        6,
        ({ min }) => `La contraseña debe tener al menos ${min} caracteres`
      ),
    
  });
  
  // Hook data user
  useEffect(() => {
    getDataUser();
    console.log("Perfil");    
  }, []);
  

  // Funcion para cambiar contraseña
  const onChangePasword = () => {
  
    var user = auth.currentUser;
    
    const credential = EmailAuthProvider.credential(
      user.email, 
      password
      );
      
      if(newPassword.length==0||confPass.length==0 || password.length==0){
        alert("La contraseña no puede estar vacia");
        return;
      }

      if(newPassword!==confPass){
        alert("Las contraseñas no coinciden");
        return;
      }
      if(newPassword.length<6){
        alert("La contraseña debe tener al menos 6 caracteres");
        return;
      }

    reauthenticateWithCredential(user,credential).then(() => {
      updatePassword(user,newPassword).then( ()=> {
        setViewModal(false);
        showMessage({
          message: "Correcto",
          description: "La contraseña se ha actualizado con éxito",
          type: "success",
          icon: "success",
        });
      }).catch((error) => alert(error.message));

    }).catch(() => {
      alert("La contraseña actual no es correcta");
    });
   
  }

  return (
    // Componente padre
    <View style={{backgroundColor:"#4632A1",... styles.container}}>
      <Animatable.Text animation="pulse" easing="ease-out" iterationCount="infinite" style={styles.title} >{dataUser.name} </Animatable.Text>
      <Animatable.Text animation="pulse" easing="ease-out" iterationCount="infinite" style={styles.subtitle} >{dataUser.email} </Animatable.Text>
      <View style={{
        backgroundColor:"white",
        padding:10,
        margin:10,
        borderWidth:40,
        borderRadius:10,
        borderColor:"white",
        ... styles.buttonContainer,
        width:"80%",
        }}>
        <TouchableOpacity
          style={[styles.button, styles.buttonOutline]}
          onPress={() => {
            setViewModal(true);
          }}
        >
          <Modal
            animationType="slide"
            onDismiss={() => console.log("se cerro")}
            onShow={() => console.log("se abrio")}
            transparent
            visible={viewModal}
          >
            {/* fondo */}
            <View
              style={{
                flex: 1,
                backgroundColor: "rgba(1,1,1,0.5)",
                justifyContent: "center",
                alignItems: "center",
              }}
            >
              {/* Cuadro de dialogo */}
              <View
                style={{
                  height: "80%",
                  width: "85%",
                  backgroundColor: "white",
                  borderRadius: 10,
                }}
              >
                {/* Header */}
                <View
                  style={{
                    height: 45,
                    width: "100%",
                    flexDirection: "row",
                    alignItems: "center",
                    justifyContent: "flex-end",
                    paddingHorizontal: 10,
                    marginTop: 10,
                  }}
                >
                  <TouchableOpacity
                    onPress={() => {
                      setViewModal(false);
                    }}
                  >
                    <Image
                      source={close}
                      style={{
                        tintColor: "#332f45",
                        marginRight: 10,
                      }}
                    />
                  </TouchableOpacity>
                </View>

                {/* Inputs valores */}

                <Formik
                  initialValues={{
                    pass: "",
                    newPass: "",
                    confirmPass: "",
                  }}
                  onSubmit={(values) => {
                    console.log(values);
                    setNewPassword(values.newPass);
                  }}
                  validationSchema={validationSchema}
                >
                  {({ handleChange, handleBlur, handleSubmit, values, errors,touched }) => (
                    <View style={styles.container}>
                      <View style={styles.inputContainer}>
                        <TextInput
                          placeholder="Contraseña actual"
                          onChangeText={(text) => {
                            setPassword(text),
                              (values.pass = text),
                              handleChange("pass")
                          }}
                          onBlur={handleBlur("pass")}
                          value={values.pass}
                          style={styles.input}
                          secureTextEntry
                        />
                        
                   {errors.password && touched.password && (
                      <Text>{errors.password}</Text>
                    )}
                        <TextInput
                          placeholder="Nueva Contraseña"
                          onChangeText={(text) => {
                            setNewPassword(text),
                              (values.newPass = text),
                              handleChange("newPass")
                          }}
                          onBlur={handleBlur("newPass")}
                          value={values.newPass}
                          style={styles.input}
                          secureTextEntry
                        />

                        <TextInput
                            placeholder="Confirmar Contraseña"
                            onChangeText={(text) => {
                              setConfPass(text),
                                (values.confirmPass = text),
                                handleChange("confirmPass")
                            }}
                            onBlur={handleBlur("confirmPass")}
                            value={values.confirmPass}
                            style={styles.input}
                            secureTextEntry
                        />
                      {
                      newPassword !== confPass && (
                          <Text style={styles.error}>
                            Las contraseñas no coinciden 
                          </Text>)
                        }
                      </View>

                      {/* Botones Modal */}
                    
                      <View style={{
                                    width: "40%",
                                    marginTop: 40,
                                    flexDirection: "row",
                                    justifyContent: "center",
                                    alignItems: "center",
                        }}>
                          
                        <TouchableOpacity
                          onPress={() => {setViewModal(false)}}
                          style={{... styles.button, ... styles.buttonOutline, marginTop:0, padding: 10 , marginRight: 10}}
                        >
                          <Text style={styles.buttonOutlineText}>Cancelar</Text>
                        </TouchableOpacity>
                        <TouchableOpacity
                        onPress={()=>{handleSubmit; onChangePasword(); console.log('ultima contra',values.newPass)}}
                          style={{... styles.button,marginTop:0, padding: 10}}
                        >
                          <Text style={styles.buttonText}>Confirmar</Text>
                        </TouchableOpacity>
                      </View>
                      </View>
                  )}
                </Formik>
              </View>
            </View>
          </Modal>

          {/* Botones Screen */}
          <Text style={styles.buttonOutlineText}>Cambiar contraseña</Text>
        </TouchableOpacity>
        <TouchableOpacity style={styles.button} onPress={handleSignup}>
          <Text style={styles.buttonText}>Cerrar Sesion</Text>
        </TouchableOpacity>
 
      </View>
    </View>
  );
};

export default ProfileScreen;