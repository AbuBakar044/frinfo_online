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
    apiKey: 'AIzaSyCWxvTljQ7i5yeGePN7L2sKITtncRlYfSQ',
    appId: '1:358802374234:web:beec9aacd86379a3ef2263',
    messagingSenderId: '358802374234',
    projectId: 'frinfoonline',
    authDomain: 'frinfoonline.firebaseapp.com',
    storageBucket: 'frinfoonline.appspot.com',
    measurementId: 'G-1W9KQ41MQY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDbJR9TKmUAuMj5x9zMw38aP-jqXaPUzng',
    appId: '1:358802374234:android:78b852fad7e26e6cef2263',
    messagingSenderId: '358802374234',
    projectId: 'frinfoonline',
    storageBucket: 'frinfoonline.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD3PtvOzy_C2Hd2eZ5cUqENx_9ES6gc71o',
    appId: '1:358802374234:ios:5f5e6344ea379f21ef2263',
    messagingSenderId: '358802374234',
    projectId: 'frinfoonline',
    storageBucket: 'frinfoonline.appspot.com',
    iosBundleId: 'com.example.frinfoOnline',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD3PtvOzy_C2Hd2eZ5cUqENx_9ES6gc71o',
    appId: '1:358802374234:ios:3f6f612c3f44987def2263',
    messagingSenderId: '358802374234',
    projectId: 'frinfoonline',
    storageBucket: 'frinfoonline.appspot.com',
    iosBundleId: 'com.example.frinfoOnline.RunnerTests',
  );
}
