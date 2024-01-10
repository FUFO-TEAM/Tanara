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
    apiKey: 'AIzaSyBCXXcbRUNMbvMVXSXwLlTJDGJQK9TMDzE',
    appId: '1:1031359521802:web:d5761f16f1b157dc136bf3',
    messagingSenderId: '1031359521802',
    projectId: 'tanara-2962b',
    authDomain: 'tanara-2962b.firebaseapp.com',
    databaseURL: 'https://tanara-2962b-default-rtdb.firebaseio.com',
    storageBucket: 'tanara-2962b.appspot.com',
    measurementId: 'G-N0H2TN4TRK',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB08TDWfV6gYl6sFsbrG9jQn-4_BSpt-9A',
    appId: '1:1031359521802:android:d5f7521998ddce2b136bf3',
    messagingSenderId: '1031359521802',
    projectId: 'tanara-2962b',
    databaseURL: 'https://tanara-2962b-default-rtdb.firebaseio.com',
    storageBucket: 'tanara-2962b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC4jQACl7trwgubIFqkIrjgj328Ne9wuNA',
    appId: '1:1031359521802:ios:502ad480477fce0f136bf3',
    messagingSenderId: '1031359521802',
    projectId: 'tanara-2962b',
    databaseURL: 'https://tanara-2962b-default-rtdb.firebaseio.com',
    storageBucket: 'tanara-2962b.appspot.com',
    iosClientId: '1031359521802-d0d7qh9rem0kgn7l0hcvihfd8httav2j.apps.googleusercontent.com',
    iosBundleId: 'com.example.tanara',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC4jQACl7trwgubIFqkIrjgj328Ne9wuNA',
    appId: '1:1031359521802:ios:279a2f8ec8e52ec2136bf3',
    messagingSenderId: '1031359521802',
    projectId: 'tanara-2962b',
    databaseURL: 'https://tanara-2962b-default-rtdb.firebaseio.com',
    storageBucket: 'tanara-2962b.appspot.com',
    iosClientId: '1031359521802-2icsib50f4lud3pjvnvivlsoih6haiku.apps.googleusercontent.com',
    iosBundleId: 'com.example.tanara.RunnerTests',
  );
}
