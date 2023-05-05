import 'package:flutter_demo/auth.dart';
import 'package:flutter_demo/Pages/Home.dart';
import 'package:flutter_demo/Pages/Login.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder:(context, snapshot) {
        if(snapshot.hasData){
          return HomePage();
        }
        else{
          return const Login();
        }
      },
    );
  }
}