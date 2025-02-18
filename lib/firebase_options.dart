// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
   apiKey: "AIzaSyAsG-seVNZcf3YXJxEychiiRSewMBx0Odc",
  authDomain: "smarthomeapplication-552e2.firebaseapp.com",
  projectId: "smarthomeapplication-552e2",
  storageBucket: "smarthomeapplication-552e2.appspot.com",
  messagingSenderId: "211575409447",
  appId: "1:211575409447:web:396ba46167b4072a9c7702",
  measurementId: "G-0VYTWK3M5M"
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD-gPXrPJte6fmzZ4VNp4dDg2WxLKZBnBU',
    appId: '1:211575409447:android:eab4de408e65849f9c7702',
    messagingSenderId: '211575409447',
    projectId: 'smarthomeapplication-552e2',
    storageBucket: 'smarthomeapplication-552e2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCKUIiUYSbUvTABoKfCtyuzZPBtR7Wc_iM',
    appId: '1:211575409447:ios:c87f66b08854bd929c7702',
    messagingSenderId: '211575409447',
    projectId: 'smarthomeapplication-552e2',
    storageBucket: 'smarthomeapplication-552e2.appspot.com',
    iosBundleId: 'com.example.smartHomeApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCKUIiUYSbUvTABoKfCtyuzZPBtR7Wc_iM',
    appId: '1:211575409447:ios:c87f66b08854bd929c7702',
    messagingSenderId: '211575409447',
    projectId: 'smarthomeapplication-552e2',
    storageBucket: 'smarthomeapplication-552e2.appspot.com',
    iosBundleId: 'com.example.smartHomeApplication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAsG-seVNZcf3YXJxEychiiRSewMBx0Odc',
    appId: '1:211575409447:web:98e7e5b62284253c9c7702',
    messagingSenderId: '211575409447',
    projectId: 'smarthomeapplication-552e2',
    authDomain: 'smarthomeapplication-552e2.firebaseapp.com',
    storageBucket: 'smarthomeapplication-552e2.appspot.com',
    measurementId: 'G-88GQ1QVRLS',
  );
}
