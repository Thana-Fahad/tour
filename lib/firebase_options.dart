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
        return macos;
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
    apiKey: 'AIzaSyAb1hT-ZdrbaJhnxHw5-UQLZP5XD4h16to',
    appId: '1:523454241379:web:ab1c652b26080d2ce3f656',
    messagingSenderId: '523454241379',
    projectId: 'tour-e8977',
    authDomain: 'tour-e8977.firebaseapp.com',
    storageBucket: 'tour-e8977.appspot.com',
    measurementId: 'G-JWM3BF0XMB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAGegxc9duPGwU1KZuOX006dcVfs6PpvEM',
    appId: '1:523454241379:android:d0ec0a50009f5cebe3f656',
    messagingSenderId: '523454241379',
    projectId: 'tour-e8977',
    storageBucket: 'tour-e8977.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCPSIRvZWeS_zaVk1ZxbCWOz8LLuJKi1Z8',
    appId: '1:523454241379:ios:95ddf1ec20ab9e3fe3f656',
    messagingSenderId: '523454241379',
    projectId: 'tour-e8977',
    storageBucket: 'tour-e8977.appspot.com',
    iosBundleId: 'com.example.tour',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCPSIRvZWeS_zaVk1ZxbCWOz8LLuJKi1Z8',
    appId: '1:523454241379:ios:bf97c603236071e9e3f656',
    messagingSenderId: '523454241379',
    projectId: 'tour-e8977',
    storageBucket: 'tour-e8977.appspot.com',
    iosBundleId: 'com.example.tour.RunnerTests',
  );
}
