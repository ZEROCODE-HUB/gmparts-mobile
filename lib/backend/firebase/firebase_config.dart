import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBcY4fRbtUVrQyM2Y_IywgPmQLPV_j79-o",
            authDomain: "g-m-parts-lac7fg.firebaseapp.com",
            projectId: "g-m-parts-lac7fg",
            storageBucket: "g-m-parts-lac7fg.appspot.com",
            messagingSenderId: "192029790072",
            appId: "1:192029790072:web:09dd0119229174fcc6428d"));
  } else {
    await Firebase.initializeApp();
  }
}
