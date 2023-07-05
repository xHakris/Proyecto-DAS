// Import the functions you need from the SDKs you need
// import * as firebase from 'firebase';
import firebase from 'firebase/compat/app';
import 'firebase/compat/auth';
// import 'firebase/compat/firestore';

import { getFirestore } from 'firebase/firestore/lite';
// import { getFirestore } from "firebase/firestore";

// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyAdMWClifyb3--Xh7luoNB9k5V0SPGP9OY",
  authDomain: "taskmanageruta.firebaseapp.com",
  projectId: "taskmanageruta",
  storageBucket: "taskmanageruta.appspot.com",
  messagingSenderId: "681898322158",
  appId: "1:681898322158:web:972dbe3d9c4a53c9aa6bff"
};

let app;

if (firebase.apps.length === 0) {
  app = firebase.initializeApp(firebaseConfig)
} else {
  app = firebase.app();
}

const db = getFirestore(app);
const auth = firebase.auth();

export { db, auth };

