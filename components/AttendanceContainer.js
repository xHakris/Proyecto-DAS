
import {
    View,
    Text,
    TouchableOpacity,
    Modal,
    Image,
    StyleSheet,
  } from "react-native";
  import React, { useState, useEffect } from "react";
  import close from "../assets/icons/close.png";
  import RadioButtonRN from "radio-buttons-react-native";
  // import Icon from "react-native-vector-icons/FontAwesome";
  import { auth, db } from "../firebase";
  import {
    collection,
    getDocs,
    doc,
    setDoc,
    getDoc,
  } from "firebase/firestore/lite";
  import { Dimensions } from "react-native";
  
  import { PixelRatio } from "react-native";
  
  import { useNavigation } from "@react-navigation/native";
  import QRScanner from "../components/QRScanner"
  
  var FUENTE = 18;
  
  if (PixelRatio.getFontScale() <= 1) {
    FUENTE = 14;
  }
  
  let width = Dimensions.get("window").width;
  console.log("Aqui el ancho", width);
  
  
  
  const AttendanceContainer = ({
    typeOfActivity,
    activity,
    date,
    hours,
    state,
    index,
    areaPertenece,
    nombre,
    tipo,
    diasDuracion,
    organizador,
    notaFinal,
    integrantes,
    dia
  }) => {
    const [viewModal, setViewModal] = useState(false);
    const [selected, setSelected] = useState("");
    const [stateCurren, setStateCurren] = useState(state);
    const [mostrar, setMostrar] = useState(true);
    const [stateActivity, setStateActivity] = useState(state);
  
    const data = [
      {
        label: "No iniciada",
      },
      {
        label: "En proceso",
      },
      {
        label: "Terminada",
      },
    ];
  
    // Actualizar estado de actividad
    // const updateActivity = async () => {
    //   if (selected.label === undefined) {
    //     return;
    //   }
    //   if (stateActivity.toUpperCase() === selected.label.toUpperCase()) {
    //     return;
    //   }
    //   const docRef = doc(db, "listadoActividades", auth.currentUser.uid);
    //   const docSnap = await getDoc(docRef);
    //   const data = docSnap.data();
    //   data.activities[index].state = selected.label.toLowerCase();
    //   await setDoc(doc(db, "listadoActividades", auth.currentUser.uid), data);
    //   setStateActivity(selected.label.toLowerCase());
    // };
  
    // const navigation = useNavigation();
  
    // const navigateToActivityDetails = () => {
    //   console.log("Entro a navegacion")
    //   navigation.navigate("Asistencia", {
    //     nombre,
    //     diasDuracion,
    //     notaFinal,
    //     dia
    //   });
    // };
  
  
    return (
      <TouchableOpacity
        onPress={()=>{
            setViewModal(true)
        }
        //   navigateToActivityDetails
        }
      >
        <View
          flexDirection="row"
          justifyContent="space-around"
          borderRadius={20}
          backgroundColor="white"
          margin={4}
          alignItems="center"
          border={1}
          style={{
            backgroundColor: "white",
            ...styles.shadow,
          }}
          height={50}
          
          
        >

          <View width="100%" alignItems="center">
            <View>
              <Text
                style={{
                  fontSize: width / 28,
                }}
                // numberOfLines={1}
                // adjustsFontSizeToFit
                // style={{fontSize:14}}
              >
                {"ASISTENCIA DIA : "+dia}
              </Text>
            </View>
          </View>
        </View>

        <Modal animationType="slide" transparent visible={viewModal}>
        {/* FONDO */}
        <View
          style={{
            flex: 1,
            backgroundColor: "rgba(0,0,0,0.5)",
            justifyContent: "center",
            alignItems: "center",
          }}
        >
          {/* CUADRO DE DIALOGO ESTADO */}
          <View
            style={{
              height: "60%",
              width: "90%",
              backgroundColor: "white",
              borderRadius: 10,
            }}
          >
            {/* HEADER */}
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
              {/* Imagen Cerrar */}
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

            {/* CONTENIDO ESTADOS */}
            {/* <View
              justifyContent="center"
              style={{
                flex: 1,
                alignItems: "center",
              }}
            > */}

                <QRScanner/>
                <Text> </Text>
            {/* </View> */}

            {/* BOTONES */}
            <View
              style={{
                width: "100%",
                flexDirection: "row",
                justifyContent: "center",
                marginBottom: 30,
              }}
            >
              <TouchableOpacity
                onPress={() => {
                  setViewModal(false);
                }}
                style={{
                  ...styles.button,
                  ...styles.buttonOutline,
                  marginTop: 0,
                  padding: 10,
                  marginRight: 10,
                }}
              >
                <Text style={styles.buttonOutlineText}>Cancelar</Text>
              </TouchableOpacity>

              <TouchableOpacity
                onPress={() => {
                  updateActivity();
                  setViewModal(false);
                }}
                style={{ ...styles.button, marginTop: 0, padding: 10 }}
              >
                <Text style={styles.buttonText}>Confirmar</Text>
              </TouchableOpacity>
            </View>
          </View>
        </View>
      </Modal>
        
     
      </TouchableOpacity>
    );
  };
  
  export default AttendanceContainer;
  
  const styles = StyleSheet.create({
    button: {
      backgroundColor: "#4632A1",
      width: "40%",
      padding: 15,
      borderRadius: 10,
      alignItems: "center",
      borderColor: "#4632A1",
      borderWidth: 2,
      marginTop: 20,
    },
    buttonText: {
      color: "white",
      fontWeight: "700",
      fontSize: 16,
    },
    buttonOutlineText: {
      color: "#4632A1",
      fontWeight: "700",
      fontSize: 16,
    },
    buttonOutline: {
      backgroundColor: "white",
      marginTop: 5,
    },
    shadow: {
      shadowColor: "#7F5DF0",
      shadowOffset: {
        width: 0,
        height: 10,
      },
      shadowOpacity: 0.25,
      shadowRadius: 3.5,
      elevation: 5,
    },
  });
  