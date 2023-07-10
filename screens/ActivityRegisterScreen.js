import React, { useEffect } from "react";
import { StyleSheet, Text, View, TouchableOpacity } from "react-native";
import { Formik } from "formik";
import { TextInput } from "react-native";
import { KeyboardAvoidingView } from "react-native";
import { useState, useContext } from "react";
import { auth, db } from "../firebase";
import DateTimePickerModal from "react-native-modal-datetime-picker";
import {
  collection,
  getDocs,
  doc,
  setDoc,
  getDoc,
  updateDoc,
  query,
  where
} from "firebase/firestore/lite";

import { ConfigContext } from "../context/ConfigContext";
import { ListUserContext } from "../context/ListUserContext";
import { showMessage } from "react-native-flash-message";
import { Dimensions } from "react-native";
import { Picker } from "@react-native-picker/picker";

const ActivityRegisterScreen = () => {
  const [isDatePickerVisible, setDatePickerVisibility] = useState(false);
  const [TActivity, setTActivity] = useState(0);
  const [datePicker, setDatePicker] = useState("Fecha");
  const [lists, setLists] = useState([]);
  const [mostrar, setMostrar] = useState(true);
  const [current, setCurrent] = useState("");
  const [members, setMembers] = useState([]);
  const [student, setStudent] = useState("");

  let width = Dimensions.get("window").width;

  // Obtener datos del usuario
  const getDataUser = async () => {
    const docRef = doc(db, "users", auth.currentUser.uid);
    const docSnap = await getDoc(docRef);
    const data = docSnap.data();
    setCurrent(data);
    console.log(dataUser);
  };

  //Formulario
  const resetComponent = () => {
    setMostrar(false);
    setTimeout(() => {
      setMostrar(true);
    }, 0.4);
  };

  const showDatePicker = () => {
    setDatePickerVisibility(true);
  };

  const hideDatePicker = () => {
    setDatePickerVisibility(false);
  };

  // Establecer actividad
  const SetData = async (activity) => {
    console.log("Aqui activity", activity);
    if (activity.typeOfActivity == 0) {
      alert("Seleccione un tipo de actividad");
      return;
    }
    if (activity.activity == 0) {
      alert("Seleccione una actividad");
      return;
    }
    if (activity.date == "Fecha") {
      alert("Seleccione una fecha");
      return;
    }
    if (activity.hours == "") {
      alert("Seleccione una catidad de horas");
      return;
    }
    if (activity.personRequesting == 0) {
      alert("Seleccione una persona que solicita");
      return;
    }
    if (activity.state == 0) {
      alert("Seleccione un estado");
      return;
    }

    var valoresAceptados = /^[0-9]+$/;

    if (!activity.hours.match(valoresAceptados)) {
      alert("Ingrese una cantidad de horas valida");
      // resetComponent();
      return;
    }

    // Compureba que las horas sea mayor a 0 y menor a 24
    if (activity.hours <= 0 || activity.hours >= 24) {
      alert("Ingrese una cantidad de horas valida");
      // resetComponent();
      return;
    }

    const docRef = doc(db, "listadoActividades", auth.currentUser.uid);
    const docSnap = await getDoc(docRef);
    const data = docSnap.data();

    if (docSnap.exists()) {
      await setDoc(doc(db, "listadoActividades", auth.currentUser.uid), {
        activities: [activity, ...data.activities],
        name: current.name,
      });
      showMessage({
        message: "Correcto",
        description: "La actividad se ha registrado correctamente",
        type: "success",
        icon: "success",
      });
      setDatePicker("Fecha");
      setTActivity(0);
      resetComponent();
    } else {
      await setDoc(doc(db, "listadoActividades", auth.currentUser.uid), {
        activities: [activity],
        name: current.name,
      });
      showMessage({
        message: "Sesión cerrada con éxito",
        description: "La sesión se ha cerrado con éxito",
        type: "success",
        icon: "success",
      });
      setDatePicker("Fecha");
      setTActivity(0);
      resetComponent();
    }
  };

  //Confir modal
  const handleConfirm = (date) => {
    const formatDate = (date) => {
      let formatted_date =
        date.getDate() + "-" + (date.getMonth() + 1) + "-" + date.getFullYear();
      return formatted_date;
    };
    setDatePicker(formatDate(date));
    hideDatePicker();
  };

  //Obtener lista de actividades
  const getListsUser = async () => {
    const confs = collection(db, "users");
    const confsSnap = await getDocs(confs);
    const data = confsSnap.docs.map((doc) => doc.data());
    console.log(data);
    setLists(data);
  };

  useEffect(() => {
    // getListsUser();
    // getDataUser();
    getCourses();
  }, []);

  useEffect(() => {
    if(TActivity===0){
      setMembers([]);
    }
    getMembers();
  }, [TActivity]);

  const [courses, setCoruses] = useState([]);

  const getCourses = async () => {
    console.log("COURSEEEES");
    const querySnapshot = await getDocs(collection(db, "evento"));
    console.log("queryyy", querySnapshot);
    const data = [];
    console.log("aaaaaaaaoooo");

    querySnapshot.forEach((doc) => {
      console.log("aaaaaaaaoooo2");

      data.push(doc.data());
      console.log("DATAAAAA ===", doc.data());
    });

    setCoruses(data);
  };

  const getMembers = () => {
    const data = [];
    if (TActivity !== 0) {
      const selectedEvent = courses.find(
        (event) => event.nombre === TActivity.toString()
      );
      if(selectedEvent===undefined){
        setMembers([])
        return;
      }
      // console.log("SIU"+ selectedEvent.integrantes[0].nombre)
      selectedEvent.integrantes.map((estudiante) => {
        data.push(estudiante.nombre);
      });
      setMembers(data);
      console.log(members + "MIEM");
    }
  };

  const setDataStudent = async (activity) => {
    // Validar los campos de actividad (previo al código existente)
  
    // Obtener el UID del evento seleccionado
    const eventUid = await getEventUid(activity.typeOfActivity);
    if (!eventUid) {
      alert("Seleccione un evento válido");
      return;
    }    

    if (!activity.hours) {
      alert("Ingrese una calificacion");
      return;
    }
    
    // Obtener el estudiante seleccionado
    const studentName = activity.activity;
    const eventRef = doc(db, "evento", eventUid);
    
    try {
      const eventSnapshot = await getDoc(eventRef);
      if (eventSnapshot.exists()) {
        const eventData = eventSnapshot.data();
        const integrantes = eventData.integrantes || [];
  
        const studentToUpdate = integrantes.find((student) => student.nombre === studentName);
        if (!studentToUpdate) {
          alert("No se encontró al estudiante"); // Display an alert if the student is not found
          return;
        }
  
        const updatedStudent = { ...studentToUpdate, notaFinal: parseFloat(activity.hours) };
        const updatedIntegrantes = integrantes.map((student) => (student.nombre === studentName ? updatedStudent : student));
  
        await updateDoc(eventRef, { integrantes: updatedIntegrantes });
  
        showMessage({
          message: "Correcto",
          description: "La calificación se ha guardado correctamente",
          type: "success",
          icon: "success",
        });
        setTActivity("");
      } else {
        alert("No se encontró el evento"); // Display an alert if the event document doesn't exist
      }
    } catch (error) {
      console.error("Error al guardar la calificación:", error);
      alert("Error al guardar la calificación. Por favor, intenta nuevamente.");
    }
  };
  

  
  
  // Lógica para obtener el UID del documento
  const getEventUid = async (eventName) => {
    const eventosRef = collection(db, "evento");
    const q = query(eventosRef, where("nombre", "==", eventName));
    const querySnapshot = await getDocs(q);
  
    if (!querySnapshot.empty) {
      const docSnapshot = querySnapshot.docs[0];
      const uid = docSnapshot.id;
      console.log("UID del documento:", uid);
      return uid;
    } else {
      console.log("El documento no fue encontrado");
      return null;
    }
  };
  
  

  if (!mostrar) {
    return <View></View>;
  }
  return (
    <Formik
      initialValues={{
        typeOfActivity: "",
        activity: "",
        date: "",
        hours: "",
        personRequesting: "",
        state: "",
        observations: "",
      }}
      validate={(values) => {
        const errors = {};

        return errors;
      }}
      onSubmit={(values, { resetForm }) => {
          setDataStudent(values);
          resetForm();
      }}
    >
      {({
        errors,
        handleChange,
        handleBlur,
        handleSubmit,
        values,
        resetForm,
      }) => (
        <View
          style={{
            alignItems: "center",
            flex: 1,
            backgroundColor: "#F8F3FF",
          }}
        >
          <KeyboardAvoidingView
            enabled={true}
            behavior={Platform.OS === "ios" ? "padding" : "padding"}
            style={{
              backgroundColor: "#4632A1",
              // borderWidth: width / 24,
              borderLeftWidth: width / 24,
              borderRightWidth: width / 24,
              marginTop: width / 16,
              borderColor: "#4632A1",
              borderRadius: width / 24,
              padding: width / 24,
              ...styles.inputContainer,
              maxHeight: "100%",
              justifyContent: "center",
            }}
          >
            {/* Picker tipo de actividad  */}
            <TouchableOpacity
              style={{
                ...styles.picker,
                height: width / 10.5,
                borderRadius: width / 48,
                alignContent: "center",
                justifyContent: "center",
                marginTop: width / 48,
                marginBottom: width / 48,
              }}
            >
              <Picker
                mode="dropdown"
                onValueChange={(itemValue, itemIndex) => {
                  values.typeOfActivity = itemValue;
                  setTActivity(itemValue); // Cambio realizado aquí
                }}
                onBlur={handleBlur}
                selectedValue={TActivity.toString()}
                style={{
                  fontColor: "#4632A1",
                }}
              >
                <Picker.Item
                  color="#898989"
                  label="Seleccione un evento"
                  value="0"
                />

                {courses.length > 0
                  ? courses.map((act) => (
                      <Picker.Item
                        label={act.nombre}
                        key={act.nombre}
                        value={act.nombre}
                      />
                    ))
                  : null}
              </Picker>
            </TouchableOpacity>

            {/* {errors.typeOfActivity && <Text style={styles.errors}>{errors.typeOfActivity}</Text>} */}

            {/* Picker actividad */}
            <TouchableOpacity
              style={{
                ...styles.picker,
                height: width / 10.5,
                alignContent: "center",
                justifyContent: "center",
                marginTop: width / 48,
                marginBottom: width / 48,
              }}
            >

              {console.log("AQUI LOS MIEMBROS " + members)}
              <Picker
                mode="dropdown"
                onValueChange={(itemValue, itemIndex) => {
                  handleChange("activity")(itemValue); // Actualizar el valor seleccionado en el estado del formulario
                }}
                selectedValue={values.activity}
                onBlur={handleBlur("activity")}
              >
                <Picker.Item
                  color="#898989"
                  label="Seleccione un integrante"
                  value="0"
                />
                {members.length > 0 &&
                  members.map((member) => (
                    <Picker.Item label={member} key={member} value={member} />
                  ))}
              </Picker>
            </TouchableOpacity>
            {/* {errors.activity && <Text style={styles.errors}>{errors.activity}</Text>} */}

            {/* Fecha */}



            {/* Calificacion */}

            <View>
              <TextInput
                onChangeText={handleChange("hours")}
                onBlur={handleBlur("hours")}
                value={values.hours}
                style={{
                  ...styles.input,
                  height: width / 10.5,
                  paddingHorizontal: width / 32,
                  paddingVertical: width / 48,
                  borderRadius: width / 48,
                  marginTop: width / 48,
                  marginBottom: width / 48,
                }}
                placeholder="Calificación"
                type="password"
                maxLength={2}
              />
            </View>

            <View
              style={{
                ...styles.buttonContainer,
                marginTop: width / 48,
              }}
            >
              <TouchableOpacity
                onPress={() => {
                  handleSubmit();
                  values.date = datePicker;
                }}
                title="Submit"
                style={{
                  backgroundColor: "#4632A1",
                  width: "50%",
                  padding: width / 32,
                  borderRadius: width / 48,
                  alignItems: "center",
                  borderColor: "#4632A1",
                  borderWidth: width / 240,
                  backgroundColor: "white",
                  height: width / 8.5,
                  // marginTop: width / 96,
                }}
                // style={[styles.button, styles.buttonOutline]}
              >
                <Text
                  style={{
                    ...styles.buttonOutlineText,
                    fontSize: width / 30,
                  }}
                >
                  Calificar
                </Text>
              </TouchableOpacity>
            </View>
          </KeyboardAvoidingView>
        </View>
      )}
    </Formik>
  );
};

export default ActivityRegisterScreen;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
  },
  button: {
    backgroundColor: "#F8F3FF",
    width: "50%",
    borderRadius: 10,
    marginTop: 40,
    marginLeft: 15,
  },
  buttonText: {
    color: "#898989",
    fontWeight: "600",
    fontSize: 15,
  },
  buttonSubmit: {
    color: "#ffff",
    fontWeight: "100",
    fontSize: 14,
  },
  inputContainer: {
    width: "90%",
    height: "80%",
  },
  input: {
    backgroundColor: "#F8F3FF",
    paddingHorizontal: 15,
    paddingVertical: 10,
    borderRadius: 10,
    marginTop: 10,
    marginBottom: 10,
    // height: 45,
  },
  buttonContainer: {
    width: "100%",
    justifyContent: "center",
    alignItems: "center",
    marginTop: 10,
  },
  picker: {
    color: "#898989",
    backgroundColor: "#F8F3FF",
    width: "100%",
    borderRadius: 10,
    //aqui css
    marginTop: 10,
    marginBottom: 10,
  },
  button: {
    backgroundColor: "#4632A1",
    width: "50%",
    padding: 15,
    borderRadius: 10,
    alignItems: "center",
    borderColor: "#4632A1",
    borderWidth: 2,
  },
  errors: {
    color: "red",
    fontSize: 12,
    marginTop: 5,
    marginBottom: 5,
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
});