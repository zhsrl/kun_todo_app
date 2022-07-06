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
    apiKey: 'AIzaSyAYARWsMaFeezRuHTFHfsHmzNkguE0CRlc',
    appId: '1:319288505035:web:9c45bae936a13ebf14614e',
    messagingSenderId: '319288505035',
    projectId: 'kun-todo-app',
    authDomain: 'kun-todo-app.firebaseapp.com',
    storageBucket: 'kun-todo-app.appspot.com',
    measurementId: 'G-SSD45FPD0X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBx92i0Q2aEtw-XzjA1tYTJpakOhWhireY',
    appId: '1:319288505035:android:9b452ebefc6947f414614e',
    messagingSenderId: '319288505035',
    projectId: 'kun-todo-app',
    storageBucket: 'kun-todo-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDWmA4aJjXF4wXg1GjEHaQYfR-57Xp5Fwg',
    appId: '1:319288505035:ios:fa9c6ebd228d950714614e',
    messagingSenderId: '319288505035',
    projectId: 'kun-todo-app',
    storageBucket: 'kun-todo-app.appspot.com',
    iosClientId: '319288505035-uab5jctokfrc3quom2o097jfuh71en2i.apps.googleusercontent.com',
    iosBundleId: 'com.example.kunTodoApp',
  );
}