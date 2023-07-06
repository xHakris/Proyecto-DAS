// Import the functions you need from the SDKs you need
// import * as firebase from 'firebase';
import firebase from 'firebase/compat/app';
import 'firebase/compat/auth';
// import 'firebase/compat/firestore';

import { getFirestore } from 'firebase/firestore/lite';
// import { getFirestore } from "firebase/firestore";

// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

const firebaseConfig = {
  apiKey: "AIzaSyBNfpHyiZCAp7aKyCqMMRLVwalnt75bl28",
  authDomain: "proyectodas-8ae3e.firebaseapp.com",
  projectId: "proyectodas-8ae3e",
  storageBucket: "proyectodas-8ae3e.appspot.com",
  messagingSenderId: "112296289374",
  appId: "1:112296289374:web:8158c8cbf008e0eb2a40cf"
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

