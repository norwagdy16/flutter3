// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBBh5ytpsnpFqzO7P6OinFgEkRIl8AqIkc',
    appId: '1:409025369438:web:097d1c959a107cad072bcf',
    messagingSenderId: '409025369438',
    projectId: 'iti23training',
    authDomain: 'iti23training.firebaseapp.com',
    storageBucket: 'iti23training.appspot.com',
    measurementId: 'G-1QQSXSTKMD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBFQYCrCVJWsKkTDsNR-q5ODcct-J6yLVo',
    appId: '1:409025369438:android:33a8266258142f52072bcf',
    messagingSenderId: '409025369438',
    projectId: 'iti23training',
    storageBucket: 'iti23training.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB1f2LavZk_U9NP8_0ZCs-TD8tC4Cl2cwk',
    appId: '1:409025369438:ios:20ff47e914e4707b072bcf',
    messagingSenderId: '409025369438',
    projectId: 'iti23training',
    storageBucket: 'iti23training.appspot.com',
    iosClientId: '409025369438-56httv252t50ouk5dfrcf0rbmeokkrpi.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterApplication2',
  );
}
