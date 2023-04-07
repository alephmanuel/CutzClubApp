import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_demo/NavigationView.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final List<bool> selections = [true, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              color: Colors.amber,
              padding: const EdgeInsets.all(0.0),
              margin:
                  const EdgeInsets.symmetric(horizontal: 120.0, vertical: 20),
              child: Container(
                  color: Colors.amber,
                  padding: const EdgeInsets.all(0),
                  child: const Image(image: AssetImage('assets/logo.jpg'))),
            ),
            Container(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ToggleButtons(
                      //list of booleans
                      isSelected: selections,
                      selectedColor: Colors.black,
                      color: Colors.grey,
                      fillColor: Colors.amber,
                      splashColor: Colors.white54,
                      highlightColor: Colors.red,
                      borderRadius: BorderRadius.circular(50),
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: Text('Log In', style: TextStyle(fontSize: 18)),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            child: Text('Register',
                                style: TextStyle(fontSize: 18))),
                      ],
                      onPressed: (int newindex) {
                        setState(() {
                          for (int index = 0;
                              index < selections.length;
                              index++) {
                            //checking for the index value
                            if (index == newindex) {
                              selections[index] = true;
                            } else {
                              selections[index] = false;
                            }
                          }
                        });
                      },
                    )
                  ],
                )),
            const Divider(
              height: 25.0,
              thickness: 1.0,
              color: Colors.white,
            ),
          ],
        )
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Navigator.push(context,
        //         MaterialPageRoute(builder: (context) => const MyBottomNavBar()));
        //   },
        //   child: Text('Login'),
        //   backgroundColor: Colors.amber,
        // ),
        );
  }
}
