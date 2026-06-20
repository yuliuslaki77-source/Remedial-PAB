import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.windows:
        return web;
      default:
        return web;
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCQKa36whk6GavMn7r70Nwbzn_68kGNt1Q',
    authDomain: 'spacenews-core-e6705.firebaseapp.com',
    appId: '1:18509116925:web:3741291eca2596b4789594',
    messagingSenderId: '18509116925',
    projectId: 'spacenews-core-e6705',
    storageBucket: 'spacenews-core-e6705.firebasestorage.app',
    measurementId: 'G-XVKCH1Q1VR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAcDbMr7RC7VrjNLhkSqufAL1d1-dns5Ek',
    appId: '1:18509116925:android:3fb56f3b30ec1887789594',
    messagingSenderId: '18509116925',
    projectId: 'spacenews-core-e6705',
    storageBucket: 'spacenews-core-e6705.firebasestorage.app',
  );
}
