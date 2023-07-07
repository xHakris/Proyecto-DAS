// import {
//   View,
//   Text,
//   TouchableOpacity,
//   Modal,
//   Image,
//   StyleSheet,
// } from "react-native";
// import React, { useState, useEffect } from "react";
// import close from "../assets/icons/close.png";
// import RadioButtonRN from "radio-buttons-react-native";
// import { auth, db } from "../firebase";
// import {
//   collection,
//   getDocs,
//   doc,
//   setDoc,
//   getDoc,
// } from "firebase/firestore/lite";
// import { Dimensions } from "react-native";

// import { PixelRatio } from "react-native";
// import QRScanner from "../components/QRScanner"

// var FUENTE = 18;

// if (PixelRatio.getFontScale() <= 1) {
//   FUENTE = 14;
// }

// let width = Dimensions.get("window").width;
// console.log("Aqui el ancho", width);

// const ListContainer = ({
//   typeOfActivity,
//   activity,
//   date,
//   hours,
//   state,
//   index,
// }) => {
//   const [viewModal, setViewModal] = useState(false);
//   const [selected, setSelected] = useState("");
//   const [stateCurren, setStateCurren] = useState(state);
//   const [mostrar, setMostrar] = useState(true);
//   const [stateActivity, setStateActivity] = useState(state);

//   const data = [
//     {
//       label: "No iniciada",
//     },
//     {
//       label: "En proceso",
//     },
//     {
//       label: "Terminada",
//     },
//   ];

//   // Actualizar estado de actividad
//   const updateActivity = async () => {
//     if (selected.label === undefined) {
//       return;
//     }
//     if (stateActivity.toUpperCase() === selected.label.toUpperCase()) {
//       return;
//     }
//     const docRef = doc(db, "listadoActividades", auth.currentUser.uid);
//     const docSnap = await getDoc(docRef);
//     const data = docSnap.data();
//     data.activities[index].state = selected.label.toLowerCase();
//     await setDoc(doc(db, "listadoActividades", auth.currentUser.uid), data);
//     setStateActivity(selected.label.toLowerCase());
//   };

//   return (
//     <TouchableOpacity
//       onPress={() => {
//         setViewModal(true);
//       }}
//     >
//       <View
//         flexDirection="row"
//         justifyContent="space-between"
//         paddingHorizontal={20}
//         paddingVertical={10}
//         borderRadius={20}
//         backgroundColor="white"
//         margin={4}
//         alignItems="center"
//         border={1}
//         style={{
//           backgroundColor: "white",
//           ...styles.shadow,
//         }}
//       >
//         <View width="35%" alignItems="center">
//           <View>
//             <Text
//               style={{
//                 fontSize: width / 32,
//               }}
//               // numberOfLines={1}
//               // adjustsFontSizeToFit
//               // style={{textAlign:'center',fontSize:14}}
//             >
//               {typeOfActivity}
//             </Text>
//           </View>
//           <View>
//             <Text
//               style={{
//                 fontSize: width / 32,
//               }}
//               // numberOfLines={1}
//               // adjustsFontSizeToFit
//               // style={{textAlign:'center',fontSize:14}}
//             >
//               {activity}
//             </Text>
//           </View>
//         </View>

//         <View width="35%" alignItems="center">
//           <View>
//             <Text
//               style={{
//                 fontSize: width / 32,
//               }}
//               // numberOfLines={1}
//               // adjustsFontSizeToFit
//               // style={{fontSize:14}}
//             >
//               {date}
//             </Text>
//           </View>
//           <View>
//             <Text
//               style={{
//                 fontSize: width / 32,
//               }}
//               //  numberOfLines={1}
//               //  adjustsFontSizeToFit
//               //  style={{fontSize:14}}
//             >
//               {hours}
//             </Text>
//           </View>
//         </View>

//         <View width="30%" alignItems="center">
//           <View>
//             <Text
//               style={{
//                 fontSize: width / 32,
//               }}
//               // numberOfLines={1}
//               // adjustsFontSizeToFit
//               // style={{fontSize:14}}
//             >
//               {stateActivity}
//             </Text>
//           </View>
//         </View>
//       </View>
//       <Modal animationType="slide" transparent visible={viewModal}>
//         {/* FONDO */}
//         <View
//           style={{
//             flex: 1,
//             backgroundColor: "rgba(0,0,0,0.5)",
//             justifyContent: "center",
//             alignItems: "center",
//           }}
//         >
//           {/* CUADRO DE DIALOGO ESTADO */}
//           <View
//             style={{
//               height: "60%",
//               width: "90%",
//               backgroundColor: "white",
//               borderRadius: 10,
//             }}
//           >
//             {/* HEADER */}
//             <View
//               style={{
//                 height: 45,
//                 width: "100%",
//                 flexDirection: "row",
//                 alignItems: "center",
//                 justifyContent: "flex-end",
//                 paddingHorizontal: 10,
//                 marginTop: 10,
//               }}
//             >
//               {/* Imagen Cerrar */}
//               <TouchableOpacity
//                 onPress={() => {
//                   setViewModal(false);
//                 }}
//               >
//                 <Image
//                   source={close}
//                   style={{
//                     tintColor: "#332f45",
//                     marginRight: 10,
//                   }}
//                 />
//               </TouchableOpacity>
//             </View>

//             {/* CONTENIDO ESTADOS
//             <View
//               justifyContent="center"
//               style={{
//                 flex: 1,
//                 alignItems: "center",
//               }}
//             >
//               {stateActivity == "no iniciada" && (
//                 <RadioButtonRN
//                   data={data}
//                   animationTypes={["rotate"]}
//                   selectedBtn={(e) => {
//                     setSelected(e);
//                   }}
//                   boxActiveBgColor="rgba(69, 40, 214, 0.05)"
//                   initial={1}
//                   boxStyle={{
//                     borderColor: "#4632A1",
//                     width: "50%",
//                   }}
//                   textStyle={{
//                     marginLeft: 25,
//                   }}
//                 />
//               )}

//               {stateActivity == "en proceso" && (
//                 <RadioButtonRN
//                   data={data}
//                   animationTypes={["rotate"]}
//                   selectedBtn={(e) => setSelected(e)}
//                   boxActiveBgColor="rgba(69, 40, 214, 0.05)"
//                   initial={2}
//                   boxStyle={{
//                     borderColor: "#4632A1",
//                     width: "50%",
//                   }}
//                   textStyle={{
//                     marginLeft: 25,
//                   }}
//                 />
//               )}

//               {stateActivity == "terminada" && (
//                 <RadioButtonRN
//                   data={data}
//                   animationTypes={["rotate"]}
//                   selectedBtn={(e) => setSelected(e)}
//                   boxActiveBgColor="rgba(69, 40, 214, 0.05)"
//                   initial={3}
//                   boxStyle={{
//                     borderColor: "#4632A1",
//                     width: "50%",
//                   }}
//                   textStyle={{
//                     marginLeft: 25,
//                   }}
//                 />
//               )}
//             </View> */}
//             <QRScanner/>

//             {/* BOTONES */}
//             <View
//               style={{
//                 width: "100%",
//                 flexDirection: "row",
//                 justifyContent: "center",
//                 marginBottom: 30,
//               }}
//             >
//               <TouchableOpacity
//                 onPress={() => {
//                   setViewModal(false);
//                 }}
//                 style={{
//                   ...styles.button,
//                   ...styles.buttonOutline,
//                   marginTop: 0,
//                   padding: 10,
//                   marginRight: 10,
//                 }}
//               >
//                 <Text style={styles.buttonOutlineText}>Cancelar</Text>
//               </TouchableOpacity>

//               <TouchableOpacity
//                 onPress={() => {
//                   updateActivity();
//                   setViewModal(false);
//                 }}
//                 style={{ ...styles.button, marginTop: 0, padding: 10 }}
//               >
//                 <Text style={styles.buttonText}>Confirmar</Text>
//               </TouchableOpacity>
//             </View>
//           </View>
//         </View>
//       </Modal>
//     </TouchableOpacity>
//   );
// };

// export default ListContainer;

// const styles = StyleSheet.create({
//   button: {
//     backgroundColor: "#4632A1",
//     width: "40%",
//     padding: 15,
//     borderRadius: 10,
//     alignItems: "center",
//     borderColor: "#4632A1",
//     borderWidth: 2,
//     marginTop: 20,
//   },
//   buttonText: {
//     color: "white",
//     fontWeight: "700",
//     fontSize: 16,
//   },
//   buttonOutlineText: {
//     color: "#4632A1",
//     fontWeight: "700",
//     fontSize: 16,
//   },
//   buttonOutline: {
//     backgroundColor: "white",
//     marginTop: 5,
//   },
//   shadow: {
//     shadowColor: "#7F5DF0",
//     shadowOffset: {
//       width: 0,
//       height: 10,
//     },
//     shadowOpacity: 0.25,
//     shadowRadius: 3.5,
//     elevation: 5,
//   },
// });


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



const ListContainer = ({
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
  correo,
  integrantes
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
    navigation.navigate("Asistencia", {
      nombre,
      diasDuracion,
      notaFinal,
      correo
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
        height={60}
        
        
      >
 

        <View width="50%" alignItems="center">
          <View>
            <Text
              style={{
                fontSize: width / 32,
              }}
              // numberOfLines={1}
              // adjustsFontSizeToFit
              // style={{fontSize:14}}
            >
              {"Nombre: "+nombre}
            </Text>
          </View>
  
        </View>

        <View width="50%" alignItems="center">
        <View>
            <Text
              style={{
                fontSize: width / 32,
              }}
              //  numberOfLines={1}
              //  adjustsFontSizeToFit
              //  style={{fontSize:14}}
            >
              {"Correo: "+ correo}
            </Text>
          </View>
        </View>
      </View>
   
    </TouchableOpacity>
  );
};

export default ListContainer;

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
