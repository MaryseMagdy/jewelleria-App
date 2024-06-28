// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'firebase_options.dart';

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
    apiKey: 'AIzaSyCaWGkJCfChGnIT_hMjbzbqY_MWYrw0qcc',
    appId: '1:373971882002:web:df74ef3e5d44f54e0ac8cb',
    messagingSenderId: '373971882002',
    projectId: 'test-bdc3b',
    authDomain: 'test-bdc3b.firebaseapp.com',
    storageBucket: 'test-bdc3b.appspot.com',
    measurementId: 'G-9XETSM9ER5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAJimqN0U3OdtjteyCtnugUgJDyDHHwJqw',
    appId: '1:373971882002:android:d200f966e0864ebc0ac8cb',
    messagingSenderId: '373971882002',
    projectId: 'test-bdc3b',
    storageBucket: 'test-bdc3b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCGKrzVyFJaeAiFmVyjiloM7kvdNz_9NiQ',
    appId: '1:373971882002:ios:fb9e105ba765ad600ac8cb',
    messagingSenderId: '373971882002',
    projectId: 'test-bdc3b',
    storageBucket: 'test-bdc3b.appspot.com',
    iosBundleId: 'com.example.test',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCGKrzVyFJaeAiFmVyjiloM7kvdNz_9NiQ',
    appId: '1:373971882002:ios:fb9e105ba765ad600ac8cb',
    messagingSenderId: '373971882002',
    projectId: 'test-bdc3b',
    storageBucket: 'test-bdc3b.appspot.com',
    iosBundleId: 'com.example.test',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCaWGkJCfChGnIT_hMjbzbqY_MWYrw0qcc',
    appId: '1:373971882002:web:9bec596e140f5d170ac8cb',
    messagingSenderId: '373971882002',
    projectId: 'test-bdc3b',
    authDomain: 'test-bdc3b.firebaseapp.com',
    storageBucket: 'test-bdc3b.appspot.com',
    measurementId: 'G-17NV5RR11Z',
  );
}
