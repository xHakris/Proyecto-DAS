import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBNfpHyiZCAp7aKyCqMMRLVwalnt75bl28",
            authDomain: "proyectodas-8ae3e.firebaseapp.com",
            projectId: "proyectodas-8ae3e",
            storageBucket: "proyectodas-8ae3e.appspot.com",
            messagingSenderId: "112296289374",
            appId: "1:112296289374:web:8158c8cbf008e0eb2a40cf"));
  } else {
    await Firebase.initializeApp();
  }
}
