import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAsj4rNT5n4eihfzUIRbh5KKvo7nbh9Hd0",
            authDomain: "car-extractor.firebaseapp.com",
            projectId: "car-extractor",
            storageBucket: "car-extractor.appspot.com",
            messagingSenderId: "16214301745",
            appId: "1:16214301745:web:90fcb297c95aef9039c910",
            measurementId: "G-Y71STJLBT6"));
  } else {
    await Firebase.initializeApp();
  }
}
