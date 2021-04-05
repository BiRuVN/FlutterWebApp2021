
import 'package:flutter/material.dart';
import 'package:blog/screens/home.dart';
// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(MyApp());

Widget home(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Blog app',
    theme: ThemeData.dark(
    ),
    home: Home(),
  );
}

class MyApp extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot){
        // Check for errors
        if (snapshot.hasError) {
          print("error snapshot");
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          print("success");
          return home(context);
        }

        // Otherwise, show something whilst waiting for initialization to complete
        print("otherwise");
      },
    );
  }
}