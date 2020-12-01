import 'dart:async';
import 'dart:io' show Platform;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geepee/screens/loginpage.dart';
import 'package:geepee/screens/mainpage.dart';
import 'package:geepee/screens/registration.dart';

//
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await Firebase.initializeApp(
    name: 'db2',
    options: Platform.isIOS
        ? FirebaseOptions(
            appId: '*************************',
            apiKey: '*************************',
            projectId: 'flutter-firebase-plugins',
            messagingSenderId: '*************************',
            databaseURL: 'https://*************************',
          )
        : FirebaseOptions(
            appId: '*************************',
            apiKey: '*************************',
            projectId: 'flutter-firebase-plugins',
            messagingSenderId: '*************************',
            databaseURL: 'https://*************************',
          ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          fontFamily: 'Brand-Regular',
          primarySwatch: Colors.green,
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (ctx, userSnapshot) {
              if (userSnapshot.hasData) {
                return MainPage();
              }
              return LoginPage();
            }),
        routes: {
          RegistrationPage.id: (context) => RegistrationPage(),
          LoginPage.id: (context) => LoginPage(),
          MainPage.id: (context) => MainPage(),
        });
  }
}
