import React from "react";
import { View, Text, ScrollView, Dimensions } from "react-native";
import {
  ImageBackground,
  StyleSheet,
  TextInput,
  TouchableOpacity,
} from "react-native";

import { useState, useEffect } from "react";
import { useNavigation } from "@react-navigation/native";
import { KeyboardAvoidingView } from "react-native";

import { auth } from "../firebase";
import { Formik } from "formik";
import * as yup from "yup";
import { Image } from "react-native-animatable";
import { UserContext } from "../context/UserContext";
import { useContext } from "react";
import { showMessage } from "react-native-flash-message";


const LoginScreens = () => {
  //Estados
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const {isAuthent, setIsAuthent} = useContext(UserContext);

  //Validaciones
  const validationSchema = yup.object().shape({
    email: yup
      .string()
      .required()
      .email("Ingresa un email valido")
      .required("El email es requerido"),
    password: yup
      .string()
      .required()
      .min(
        6,
        ({ min }) => `La contraseña debe tener al menos ${min} caracteres`
      )
      .required("La contraseña es requerida")
      .matches(
        /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/,
        "Debe contener caracteres"
      ),
  });

  const navigation = useNavigation();
  // console.log(alert(isAuthent+'En Login'));
  useEffect(() => {
    const unsubscribe = auth.onAuthStateChanged((user) => {
    
    });
    console.log("Login");
    return unsubscribe;
  }, []);

  //Iniciar session
  const handleLogin = () => {
    auth
      .signInWithEmailAndPassword(email, password)
      .then((userCredentials) => {
        const user = userCredentials.user;
        console.log("Usuario : ", user.email);
        showMessage({
          message: "Correcto",
          description: "La sesión se ha iniciado correctamente",
          type: "success",
          icon: "success",
        });
        setIsAuthent(true);
      })
      .catch((error) => alert("Credenciales incorrectas"));
  };
  return (
    //Form
    <Formik
      initialValues={{ email, password }}
      validateOnMount={true}
      onSubmit={(values) => console.log(values)}
      validationSchema={validationSchema}
    >
      {({
        handleChange,
        handleBlur,
        handleSubmit,
        values,
        touched,
        errors,
        isValid,
      }) => (
        <ScrollView
          style={{ flex: 1, backgroundColor: "#fff" }}
          showsVerticalScrollIndicator={false}
        >
          <ImageBackground
            source={require("../images/450_1000.jpg")}
            style={{ height: Dimensions.get("window").height / 2.5 }}
          >
            <View style={styles.brandView}>
              {/* <Text style={styles.brandViewText}>GESTIN</Text> */}
              <Image 
               source={require("../assets/Bite/Logo.png")}
               style={{height: 50, width: 300}}
               />
              
            </View>
          </ImageBackground>
          <View style={styles.bottomView}>
            {/* Welcome View */}
            <View style={{ padding: 40 }}>
              <Text style={{ color: "#4632A1", fontSize: 34 }}>Bienvenido</Text> 
              <Text>
                No tienes una cuenta?
                <Text style={{ color: "red", fontStyle: "italic" }}>
                  {" "}
                  Registrate ahora!
                </Text>
              </Text>
              {/* Form Inputs View */}

              <View style={{ marginTop: 50 }}>
                <KeyboardAvoidingView
                  enabled
                  behavior={Platform.OS === "ios" ? "padding" : "height"}
                  style={styles.container}
                >
                  <View style={styles.inputContainer} viewVerticalOffset={-100}>
                    <TextInput
                      placeholder="Correo Electronico"
                      value={email}
                      onChangeText={(text) => {
                        setEmail(text),
                          (values.email = text),
                          handleChange("email")

                      }}
                      onBlur={handleBlur("email")}
                      style={styles.input}
                    />
                    {errors.email && touched.email && (
                      <Text style={styles.errors}>{errors.email}</Text>
                    )}

                    <TextInput
                      placeholder="Contraseña"
                      onChangeText={(text) => {
                        setPassword(text)
                          // (values.password = text),
                          // handleChange("password"),
                          // console.log(password);
                      }}
                      // onBlur={handleBlur("password")}
                      style={styles.input}
                      value={password}
                      secureTextEntry
                    />
                    {/* {errors.password && touched.password && (
                      <Text style={styles.errors}>{errors.password}</Text>
                    )} */}
                  </View>
                  <View style={styles.buttonContainer}>
                    <TouchableOpacity
                      onPress={handleLogin}
                      style={styles.button}
                    >
                      <Text style={styles.buttonText}>Iniciar Sesion</Text>
                    </TouchableOpacity>
                   
                  </View>
                </KeyboardAvoidingView>
              </View>
            </View>
          </View>
        </ScrollView>
      )}
    </Formik>
  );
};

export default LoginScreens;

const styles = StyleSheet.create({
  brandView: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
  },
  brandViewText: {
    color: "#ffffff",
    fontSize: 40,
    fontWeight: "bold",
    textTransform: "uppercase",
  },
  bottomView: {
    flex: 1.5,
    backgroundColor: "#fff",
    bottom: 50,
    borderTopStartRadius: 60,
    borderTopEndRadius: 60,
  },
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
  },
  inputContainer: {
    width: "80%",
  },
  input: {
    backgroundColor: "#F8F3FF",
    paddingHorizontal: 15,
    paddingVertical: 10,
    borderRadius: 10,
    marginTop: 5,
  },
  buttonContainer: {
    width: "60%",
    justifyContent: "center",
    alignItems: "center",
    marginTop: 40,
  },
  button: {
    backgroundColor: "#4632A1",
    width: "100%",
    padding: 15,
    borderRadius: 10,
    alignItems: "center",
    borderColor: "#4632A1",
    borderWidth: 2,
  },
  buttonOutline: {
    backgroundColor: "white",
    marginTop: 5,
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
  errors: {
    fontSize: 14,
    color: "red",
    fontWeight: "bold",
    marginTop: 5,
  },
});
