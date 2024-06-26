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
    apiKey: 'AIzaSyDW6pKiht6yiUw6b0Zb8YpoC_MnKAZcG9E',
    appId: '1:351063024462:web:53c22bec865538c058741f',
    messagingSenderId: '351063024462',
    projectId: 'todo-4f1b9',
    authDomain: 'todo-4f1b9.firebaseapp.com',
    storageBucket: 'todo-4f1b9.appspot.com',
    measurementId: 'G-LVJ03WFE86',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCCMiBZom1Yxj47Slps-SEb7l3zZRrs7Cc',
    appId: '1:351063024462:android:d565dbafcfc9f46758741f',
    messagingSenderId: '351063024462',
    projectId: 'todo-4f1b9',
    storageBucket: 'todo-4f1b9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD0Dzy4nOQW38D2Bq2W3GsGSbk6SWij7_4',
    appId: '1:351063024462:ios:3b54f43ade6d910a58741f',
    messagingSenderId: '351063024462',
    projectId: 'todo-4f1b9',
    storageBucket: 'todo-4f1b9.appspot.com',
    iosBundleId: 'com.example.todo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD0Dzy4nOQW38D2Bq2W3GsGSbk6SWij7_4',
    appId: '1:351063024462:ios:3ed37fd579f6293558741f',
    messagingSenderId: '351063024462',
    projectId: 'todo-4f1b9',
    storageBucket: 'todo-4f1b9.appspot.com',
    iosBundleId: 'com.example.todo.RunnerTests',
  );
}
