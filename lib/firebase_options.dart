// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;

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
    apiKey: 'AIzaSyBUK6J-5fHiEADbsSxf7ox5ng8wkR1DI5Y',
    appId: '1:895312254291:web:205b776425ba31dee2fda6',
    messagingSenderId: '895312254291',
    projectId: 'medlife-546ae',
    authDomain: 'medlife-546ae.firebaseapp.com',
    storageBucket: 'medlife-546ae.appspot.com',
    measurementId: 'G-DHRN9EDQ71',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAiwqGanS3CIUX7WG24Y53bbhQqSqV73zM',
    appId: '1:895312254291:android:c4850e963bec4c2ae2fda6',
    messagingSenderId: '895312254291',
    projectId: 'medlife-546ae',
    storageBucket: 'medlife-546ae.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBsCXXmwAfjB5Su-LxPqEGbAtMJcW8KSyI',
    appId: '1:895312254291:ios:38fa16e1658d67eee2fda6',
    messagingSenderId: '895312254291',
    projectId: 'medlife-546ae',
    storageBucket: 'medlife-546ae.appspot.com',
    iosBundleId: 'com.example.medlifeAdmin',
  );
}
