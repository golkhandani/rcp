import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

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
    apiKey: 'AIzaSyBKys06fpIkzLBpsRDllaVFx375AUwwBS0',
    appId: '1:500834876642:web:311dd487e586e3ec5db2bb',
    messagingSenderId: '500834876642',
    projectId: 'bestneighbourforver',
    authDomain: 'bestneighbourforver.firebaseapp.com',
    storageBucket: 'bestneighbourforver.appspot.com',
    measurementId: 'G-KEDD7F0DQ3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCj7uy3tV5IT3z1Yl5U8qMk-hXkcK00TLQ',
    appId: '1:500834876642:android:d13f26d2871192d95db2bb',
    messagingSenderId: '500834876642',
    projectId: 'bestneighbourforver',
    storageBucket: 'bestneighbourforver.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBT9ejwqkJEwf-CZTYfoQurXYk5sWMWgGs',
    appId: '1:500834876642:ios:897e9468bf7681dd5db2bb',
    messagingSenderId: '500834876642',
    projectId: 'bestneighbourforver',
    storageBucket: 'bestneighbourforver.appspot.com',
    iosBundleId: 'com.example.bnf',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBT9ejwqkJEwf-CZTYfoQurXYk5sWMWgGs',
    appId: '1:500834876642:ios:883e9ce791c509e55db2bb',
    messagingSenderId: '500834876642',
    projectId: 'bestneighbourforver',
    storageBucket: 'bestneighbourforver.appspot.com',
    iosBundleId: 'com.example.bnf.RunnerTests',
  );
}