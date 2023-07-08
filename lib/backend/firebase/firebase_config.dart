import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDOK7mho9WuvbJVf-gRSlvxPlakB3lgSJc",
            authDomain: "appmovil-ce53e.firebaseapp.com",
            projectId: "appmovil-ce53e",
            storageBucket: "appmovil-ce53e.appspot.com",
            messagingSenderId: "168184011336",
            appId: "1:168184011336:web:d12aec1a9be0a835b5d67d"));
  } else {
    await Firebase.initializeApp();
  }
}
