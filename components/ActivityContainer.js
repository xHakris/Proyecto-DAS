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

  
  var FUENTE = 18;
  
  if (PixelRatio.getFontScale() <= 1) {
    FUENTE = 14;
  }
  
  let width = Dimensions.get("window").width;
  console.log("Aqui el ancho", width);


  
  const ActivityContainer = ({
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
    integrantes,
    responsable
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

    const navigation = useNavigation();

    const navigateToActivityDetails = () => {
      console.log("Entro a navegacion")
      navigation.navigate("Actividad", {
        areaPertenece,
        organizador,
        nombre,
        diasDuracion,
        tipo,
        integrantes,
        responsable
      });
    };
  
  
    return (
      <TouchableOpacity
        onPress={
          // setViewModal(true);
          navigateToActivityDetails
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
          height={70}
          
          
        >
          <View width="35%" alignItems="center">
            <View>
              <Text
                style={{
                  fontSize: width / 40,
                }}
                // numberOfLines={1}
                // adjustsFontSizeToFit
                // style={{textAlign:'center',fontSize:14}}
              >
                {"Area: "+areaPertenece}
              </Text>
            </View>
            <View>
              <Text
                style={{
                  fontSize: width / 40,
                }}
                // numberOfLines={1}
                // adjustsFontSizeToFit
                // style={{textAlign:'center',fontSize:14}}
              >
                {"Organizador: "+organizador}
              </Text>
            </View>
          </View>
  
          <View width="35%" alignItems="center">
            <View>
              <Text
                style={{
                  fontSize: width / 40,
                }}
                // numberOfLines={1}
                // adjustsFontSizeToFit
                // style={{fontSize:14}}
              >
                {"Nombre: "+nombre}
              </Text>
            </View>
            <View>
              <Text
                style={{
                  fontSize: width / 40,
                }}
                //  numberOfLines={1}
                //  adjustsFontSizeToFit
                //  style={{fontSize:14}}
              >
                {"Duracion: "+ diasDuracion+ " dias"}
              </Text>
            </View>
          </View>
  
          <View width="30%" alignItems="center">
            <View>
              <Text
                style={{
                  fontSize: width / 40,
                }}
                // numberOfLines={1}
                // adjustsFontSizeToFit
                // style={{fontSize:14}}
              >
                {"Tipo: "+tipo}
              </Text>
            </View>
          </View>
        </View>
     
      </TouchableOpacity>
    );
  };
  
  export default ActivityContainer;
  
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
  