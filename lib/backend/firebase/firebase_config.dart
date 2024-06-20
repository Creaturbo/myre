import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAU0_i8Act61wYdOHP7FfKnlTVnUGT8Fr4",
            authDomain: "realvoicetest2-aoj7hs.firebaseapp.com",
            projectId: "realvoicetest2-aoj7hs",
            storageBucket: "realvoicetest2-aoj7hs.appspot.com",
            messagingSenderId: "290834340712",
            appId: "1:290834340712:web:67006386b4c1c16c3c54dd"));
  } else {
    await Firebase.initializeApp();
  }
}
