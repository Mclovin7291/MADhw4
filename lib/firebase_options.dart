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
    apiKey: 'AIzaSyAJ41hBWcXAWrbJPUsgI8eqOiUC5LaJEDc',
    appId: '1:158801175842:web:5d8ebe97b5351da758f17b',
    messagingSenderId: '158801175842',
    projectId: 'madhw4-6deb0',
    authDomain: 'madhw4-6deb0.firebaseapp.com',
    storageBucket: 'madhw4-6deb0.firebasestorage.app',
    measurementId: 'G-TEPYGQS7GS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCHy_bB4W9PiHTGAcqI-Uwib5hPxWl408k',
    appId: '1:158801175842:android:8a105c6e35c6302258f17b',
    messagingSenderId: '158801175842',
    projectId: 'madhw4-6deb0',
    storageBucket: 'madhw4-6deb0.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD4PTBjUiRuPWvOUZgw3cNGolrGgthh0t4',
    appId: '1:158801175842:ios:6d2d781a5b488aa358f17b',
    messagingSenderId: '158801175842',
    projectId: 'madhw4-6deb0',
    storageBucket: 'madhw4-6deb0.firebasestorage.app',
    iosBundleId: 'com.example.madhw4',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD4PTBjUiRuPWvOUZgw3cNGolrGgthh0t4',
    appId: '1:158801175842:ios:6d2d781a5b488aa358f17b',
    messagingSenderId: '158801175842',
    projectId: 'madhw4-6deb0',
    storageBucket: 'madhw4-6deb0.firebasestorage.app',
    iosBundleId: 'com.example.madhw4',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAJ41hBWcXAWrbJPUsgI8eqOiUC5LaJEDc',
    appId: '1:158801175842:web:4e920be7b9ec07c258f17b',
    messagingSenderId: '158801175842',
    projectId: 'madhw4-6deb0',
    authDomain: 'madhw4-6deb0.firebaseapp.com',
    storageBucket: 'madhw4-6deb0.firebasestorage.app',
    measurementId: 'G-RCJ2SWH9NG',
  );
}
