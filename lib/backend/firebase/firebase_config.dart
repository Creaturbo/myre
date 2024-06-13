import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC6HuG0TLrcwkf2qRKbG5d7phUbv57dr-4",
            authDomain: "audio-recorder-app-75hh4n.firebaseapp.com",
            projectId: "audio-recorder-app-75hh4n",
            storageBucket: "audio-recorder-app-75hh4n.appspot.com",
            messagingSenderId: "506533620321",
            appId: "1:506533620321:web:812272338344af47919820"));
  } else {
    await Firebase.initializeApp();
  }
}
