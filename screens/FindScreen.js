import React, { useState, useEffect } from "react";
import {
  View,
  Text,
  StyleSheet,
  TouchableOpacity,
  Image,
  ScrollView,
  Dimensions
} from "react-native";
import DateTimePickerModal from "react-native-modal-datetime-picker";
import { doc, getDoc, getDocs,collection } from "firebase/firestore/lite";
import { auth, db } from "../firebase";
import ActivityContainer from "../components/ActivityContainer";
import { useIsFocused } from "@react-navigation/native";


const FindScreen = () => {
  const [isDatePickerVisible, setDatePickerVisibility] = useState(false);
  const [datePicker, setDatePicker] = useState("Fechas");
  const [listUser, setListUser] = useState([]);
  const isFocused = useIsFocused();

  const showDatePicker = () => {
    setDatePickerVisibility(true);
  };

  const hideDatePicker = () => {
    setDatePickerVisibility(false);
  };

  const formatDate = (date) => {
    let formatted_date =
      date.getDate() + "-" + (date.getMonth() + 1) + "-" + date.getFullYear();
    return formatted_date;
  };

  const handleConfirm = (date) => {
    setDatePicker(formatDate(date)); 
    hideDatePicker();
  };

  let width = Dimensions.get("window").width;

  const resetList = () => {
    setDatePicker("Fechas");
    userActivitys();
  }


  //Actividades de todos los usuarios
  // const userActivitys = async () => {
  //   const docRef = doc(db, "listadoActividades", auth.currentUser.uid);
  //   const docSnap = await getDoc(docRef);
  //   const data = docSnap.data();
  //   if (data === undefined) {
  //     setListUser([]);
  //   } else {
  //     setListUser(data["activities"]);
  //   }
  // };

  const userActivitys = async () => {
    const querySnapshot = await getDocs(collection(db, "evento"));
    const data = [];
    querySnapshot.forEach((doc) => {
      data.push(doc.data());
    });
    setListUser(data);
  };

  //use Effect para recargar en la navegacion 
  useEffect(() => {
    console.log("----------=======-----------")
    if (isFocused) {
      userActivitys();
      setDatePicker("Fechas");
    } else {
      return;
    }
  }, [isFocused]);



  return (
    <View
      style={{
        alignItems: "center",
        flex: 1,
        backgroundColor: "#F8F3FF",
      }}
    >
      {/* Contenedor */}
      <View
        style={{
          backgroundColor: "#4632A1",
          marginTop: 30,
          borderRadius: 20,
          flex: 0.8,
          padding: 20,
          ...styles.inputContainer,
          width: "90%",
          
        }}
        viewVerticalOffset={-100}
      >
        {/* FECHA */}
        <View
          display="flex"
          flexDirection="row"
          justifyContent="space-between"
        >
          <View
            style={{
              width: "90%",
            }}
          >
                    <TouchableOpacity
          onPress={showDatePicker}
          style={{
            width: "100%",
            ...styles.input,
            flexDirection: "row",
            justifyContent: "space-between",
            alignItems: "center",
            marginBottom: 10,
          }}
        >
          {datePicker === "Fecha" ? (
            <Text
              style={{
                fontWeight: "bold",
                ...styles.buttonText,
              }}
            >
              {datePicker}
            </Text>
          ) : (
            <Text
              style={{
                fontWeight: "bold",
                ...styles.buttonText,
                color: "black",
              }}
            >
              {datePicker}
            </Text>
          )}
          <Image
            source={require("../assets/icons/find.png")}
            style={{ width: 20, height: 20 }}
          />
        </TouchableOpacity>
        <DateTimePickerModal
          isVisible={isDatePickerVisible}
          mode="date"
          onConfirm={handleConfirm}
          onCancel={hideDatePicker}
          onTouchOutside={hideDatePicker}
        />
          
          </View>          
          <TouchableOpacity style={{
            width: "9%",
            ...styles.input,
            paddingHorizontal: width/34.2,
            marginBottom: width/48,
            marginTop: width/96,
          }}
          onPress={resetList}
          >
            <Text
            style={{
              fontWeight: "bold",
              padding:0,
            }}
            >x</Text>
            </TouchableOpacity>          
        </View>

        {/* Actividades */}
        <ScrollView
          style={{
            paddingHorizontal: width/45,
            flex: 0.9,
            width: "100%",
            backgroundColor: "#F8F3FF",
            borderRadius: width/24,
            marginTop: width/48,
          }}
        >    
     {listUser.length > 0 ?
     (
        (listUser.map((item,index) => {
            return (<ActivityContainer key={index} {...item}/>)
        }))
      ):null
     }
     

      {/* <ActivityContainer key={"asdasdx"} typeOfActivity={"asd"} activity={"asd"} date={"23/03/23"} hours={21} state={"terminada"} index={"asdasd"}/> */}

        </ScrollView>
      </View>
    </View>
  );
};

export default FindScreen;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
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
  error: {
    color: "red",
    fontSize: 12,
  },
  title: {
    fontSize: 20,
    fontWeight: "700",
    marginTop: 20,
    color: "white",
  },
  subtitle: {
    fontSize: 16,
    fontWeight: "700",
    marginTop: 5,
    color: "white",
  },
});
