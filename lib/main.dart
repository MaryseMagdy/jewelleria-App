import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:test/LoginScreen.dart';
import 'package:test/errorHandling/loadingScreen.dart';
import 'package:test/products/allProducts.dart';
import 'package:test/products/productScreen.dart';
import 'package:test/vendor/vendorProvider.dart';
import 'cart/cartScreen.dart';
import 'errorHandling/errorScreen.dart';
import 'package:test/firebase_options.dart';
import 'cart/cartProvider.dart';


// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print('Handling a background message: ${message.messageId}');
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // initializeNotifications();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      setState(() {
        _initialized = true;
        print("Firebase initialized successfully");
      });

      FirebaseMessaging.instance.getToken().then((token) {
        print("FCM Token: $token");
        // Save this token to your server or wherever necessary
      });

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('Got a message whilst in the foreground!');
        print('Message data: ${message.data}');

        if (message.notification != null) {
          print('Message also contained a notification: ${message.notification}');
         // sendPushNotification(message.notification!.body ?? 'New Notification');
        }
      });

    } catch (e) {
      setState(() {
        _error = true;
        print("Firebase initialization failed: $e");
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initializeFlutterFire();
  //  requestNotificationPermission();
  }

  Future<bool> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final String? userId = prefs.getString('userId');
    return userId != null;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VendorProvider()),
        ChangeNotifierProvider(create: (_) => cartProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: _error
              ? errorScreen()
              : !_initialized
                  ? loadingScreen()
                  : FutureBuilder(
                      future: checkLoginStatus(),
                      builder: (ctx, AsyncSnapshot<bool> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return loadingScreen();
                        }
                        if (snapshot.hasData && snapshot.data == true) {
                          return allProducts();
                        }
                        return LoginScreen();
                      },
                    ),
        ),
        routes: {
          '/cart': (context) => cartScreen(),
          '/allProducts': (context) => allProducts(),
          '/productScreen': (context) => productScreen(),
        },
      ),
    );
  }
}
