import 'package:flutter/material.dart';
import 'package:flutter_demo/NavigationView.dart';
import 'package:flutter_demo/Pages/Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_demo/firebase_options.dart';

//import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  /* List<Students> students = [];
  dynamic database; */

  // async: used to have access to the use of keyword 'await'.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barber Shop',
      home: Login(),
      theme:
          ThemeData(brightness: Brightness.dark, primarySwatch: Colors.amber),
    );
  }
}
