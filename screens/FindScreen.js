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
import { doc, getDoc } from "firebase/firestore/lite";
import { auth, db } from "../firebase";
import ActivityContainer from "../components/ActivityContainer";
import { useIsFocused } from "@react-navigation/native";

const FindScreen = () => {
 



  return (
    <Text>
      Nueva Pagina
    </Text>
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
