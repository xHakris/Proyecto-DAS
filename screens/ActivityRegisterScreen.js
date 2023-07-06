import React, { useEffect } from "react";
import {
  StyleSheet,
  Text,
  View,
  TouchableOpacity,
} from "react-native";
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
} from "firebase/firestore/lite";

import { ConfigContext } from "../context/ConfigContext";
import { ListUserContext } from "../context/ListUserContext";
import { showMessage } from "react-native-flash-message";
import { Dimensions } from "react-native";

const ActivityRegisterScreen = () => {
  const [isDatePickerVisible, setDatePickerVisibility] = useState(false);
  const [TActivity, setTActivity] = useState(0);
  const [datePicker, setDatePicker] = useState("Fecha");
  const [lists, setLists] = useState([]);
  const [mostrar, setMostrar] = useState(true);
  const [current, setCurrent] = useState("");
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

  //Establecer actividad
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

    //Compureba que las horas sea mayor a 0 y menor a 24
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
    getListsUser();
    getDataUser();
  }, []);

  const { data, setData } = useContext(ConfigContext);
  const { dataUser } = useContext(ListUserContext);
  // const tipos = data.map((conf) => conf.actividades);
  // const subTipos = tipos.map((tipo) => tipo.map((subTipo) => subTipo));

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
        SetData(values);
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
          behavior={Platform.OS === 'ios' ? 'padding' : 'padding'}
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
              {/* <Picker
                mode="dropdown"
                onValueChange={(itemValue, itemIndex) => {
                  values.typeOfActivity = itemValue;
                  setTActivity(itemIndex);
                }}
                onBlur={handleBlur}
                selectedValue={TActivity.toString()}
                style={{
                  fontColor: "#4632A1",
                }}
              >
                <Picker.Item
                  color="#898989"
                  label="Seleccione un tipo de actividad"
                  value="0"
                />

                {data.map((act) => (
                  <Picker.Item
                    label={
                      act.nombre.charAt(0).toUpperCase() + act.nombre.slice(1)
                    }
                    key={act.nombre}
                    value={act.nombre}
                  />
                ))}
              </Picker> */}
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
              {/* <Picker
                mode="dropdown"
                onValueChange={(itemValue, itemIndex) => {
                  values.activity = itemValue;
                }}
                onBlur={handleBlur}
              >
                <Picker.Item
                  color="#898989"
                  label="Seleccione una actividad"
                  value="0"
                />
                {TActivity !== 0
                  ? subTipos[TActivity - 1].map((act) => (
                      <Picker.Item
                        label={act.charAt(0).toUpperCase() + act.slice(1)}
                        key={act}
                        value={act}
                      />
                    ))
                  : null}
              </Picker> */}
            </TouchableOpacity>
            {/* {errors.activity && <Text style={styles.errors}>{errors.activity}</Text>} */}

            {/* Fecha */}

            <TouchableOpacity
              onPress={showDatePicker}
              onBlur={handleBlur}
              style={{
                width: "100%",
                ...styles.input,
                height: width / 10.5,
                paddingHorizontal: width/32,
                paddingVertical: width/48,
                borderRadius: width/48,
                marginTop: width/48,
                marginBottom: width/48,
              }}
            >
              {datePicker === "Fecha" ? (
                <Text
                  style={{
                    fontWeight: "bold",
                    ...styles.buttonText,
                    fontSize: width / 32,
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
                    fontSize: width / 32,
                  }}
                >
                  {datePicker}
                </Text>
              )}
              {/* {errors.date && <Text style={styles.errors}>{errors.date}</Text>} */}
            </TouchableOpacity>

            <DateTimePickerModal
              isVisible={isDatePickerVisible}
              mode="date"
              onConfirm={handleConfirm}
              onCancel={hideDatePicker}
              onTouchOutside={hideDatePicker}
              onChange={(date) => {
                values.date = date;
              }}
            />

            {/* Hora */}

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
                placeholder="Horas"
                type="password"
                maxLength={2}
              />
            </View>

            {/* Picker persona que solicita */}
            <TouchableOpacity
              style={{
                ...styles.picker,
                height: width / 10.5,
                alignContent: "center",
                justifyContent: "center",
                borderRadius: width / 48,
                marginTop: width / 48,
                marginBottom: width / 48,
              }}
            >
              {/* <Picker
                mode="dropdown"
                onValueChange={(itemValue, itemIndex) => {
                  values.personRequesting = itemValue;
                }}
                onBlur={handleBlur}
              >
                <Picker.Item
                  color="#898989"
                  label="Seleccione la persona que solicita"
                  value="0"
                />
                {lists.map((user) => (
                  <Picker.Item
                    label={user.email}
                    key={user.email}
                    value={user.email}
                  />
                ))}
              </Picker> */}
            </TouchableOpacity>

            {/* {errors.personRequesting && <Text style={styles.errors}>{errors.personRequesting}</Text>} */}

            {/* Picker estado */}
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
              {/* <Picker
                mode="dropdown"
                onValueChange={(itemValue, itemIndex) => {
                  values.state = itemValue;
                }}
                onBlur={handleBlur}
              >
                <Picker.Item
                  color="#898989"
                  label="Seleccione un estado"
                  value="0"
                />
                <Picker.Item label="No iniciada" value="no iniciada" />
                <Picker.Item label="En proceso" value="en proceso" />
                <Picker.Item label="Terminada" value="terminada" />
              </Picker> */}
            </TouchableOpacity>
            {/* {errors.state && <Text style={styles.errors}>{errors.state}</Text>} */}

            {/* Observaciones */}
            <View>
              <TextInput
                onChangeText={handleChange("observations")}
                onBlur={handleBlur("observations")}
                value={values.observations}
                style={{
                  ...styles.input,
                  height: width / 10.5,
                  paddingHorizontal: width / 32,
                  paddingVertical: width / 48,
                  borderRadius: width / 48,
                  marginTop: width / 48,
                  marginBottom: width / 48,
                }}
                placeholder="Observaciones"
                maxLength={40}
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
                <Text style={{
                  ...styles.buttonOutlineText,
                  fontSize: width / 30,
                }}>Crear</Text>
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