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
    apiKey: 'AIzaSyDkfBSvFZ1yEfhxHlpAdMzc7vD8u2PhB6s',
    appId: '1:525016032810:web:85c15da5f6a03e4c850553',
    messagingSenderId: '525016032810',
    projectId: 'fruit-hub-d4c36',
    authDomain: 'fruit-hub-d4c36.firebaseapp.com',
    storageBucket: 'fruit-hub-d4c36.firebasestorage.app',
    measurementId: 'G-G3GWPS939C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC0WHKkCOM5DOXPHtcP7xUIHEwjeQNZFOY',
    appId: '1:525016032810:android:b54d0230a660a9e6850553',
    messagingSenderId: '525016032810',
    projectId: 'fruit-hub-d4c36',
    storageBucket: 'fruit-hub-d4c36.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDWsV2v-ys9tALsl7uhjDVFyrSut393y-I',
    appId: '1:525016032810:ios:0f91e6256c47d0d7850553',
    messagingSenderId: '525016032810',
    projectId: 'fruit-hub-d4c36',
    storageBucket: 'fruit-hub-d4c36.firebasestorage.app',
    iosBundleId: 'com.example.fruitHub',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDWsV2v-ys9tALsl7uhjDVFyrSut393y-I',
    appId: '1:525016032810:ios:0f91e6256c47d0d7850553',
    messagingSenderId: '525016032810',
    projectId: 'fruit-hub-d4c36',
    storageBucket: 'fruit-hub-d4c36.firebasestorage.app',
    iosBundleId: 'com.example.fruitHub',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDkfBSvFZ1yEfhxHlpAdMzc7vD8u2PhB6s',
    appId: '1:525016032810:web:e23225881df1220b850553',
    messagingSenderId: '525016032810',
    projectId: 'fruit-hub-d4c36',
    authDomain: 'fruit-hub-d4c36.firebaseapp.com',
    storageBucket: 'fruit-hub-d4c36.firebasestorage.app',
    measurementId: 'G-XN9HLBSWZK',
  );

}