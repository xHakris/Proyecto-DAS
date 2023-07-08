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
  

  return (
    <Text>
      Pagina Profile
    </Text>
  );
};

export default ProfileScreen;
