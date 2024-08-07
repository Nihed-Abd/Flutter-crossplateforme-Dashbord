import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDhgoxLQpa998YM6rIneGuNps-0yBJjbPY",
            authDomain: "association-el-wafa-wlz4-7b520.firebaseapp.com",
            projectId: "association-el-wafa-wlz4l5",
            storageBucket: "association-el-wafa-wlz4l5.appspot.com",
            messagingSenderId: "619979007546",
            appId: "1:619979007546:web:654a36a37b5665b5237703"));
  } else {
    await Firebase.initializeApp();
  }
}
