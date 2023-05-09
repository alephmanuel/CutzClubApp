import 'package:flutter/material.dart';
import 'package:flutter_demo/NavigationView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_demo/main.dart';
import '../auth.dart';

//Creation of the Login page
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final formKey = GlobalKey<FormState>();
  /* ⁡⁢⁣⁣Variables⁡ */
  String? errorMessage = '';
  bool isLogin = true;

  /* These ⁡⁢⁣⁣variables⁡ will be used ⁡⁢⁣⁣for the user⁡ to type their ⁡⁢⁣⁣information⁡
  based on the requirements (⁡⁢⁣⁣email & password⁡) */
  final TextEditingController l_emailController = TextEditingController();
  final TextEditingController l_passwordController = TextEditingController();

  /* ⁡⁢⁣⁣Check if⁡ there's an ⁡⁢⁣⁣error⁡, so print a ⁡⁢⁣⁣message⁡. */
  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Hmmm? $errorMessage');
  }

  //List for the toggle button to switch between Log In and Register
  final List<bool> sign_selections = [true, false];

  //All the controllers for the user/barber information
  // ignore: non_constant_identifier_names
  TextEditingController r_fnameController = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController r_lnameController = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController r_emailController = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController r_passwordController = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController r_confirmpasswordController = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController r_phoneController = TextEditingController();

/* Start of the ⁡⁢⁣⁣LOGIN PAGE structure⁡. */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //This container is to insert the Logo image at the top of the login page
            SafeArea(
              child: Container(
                color: Colors.amber,
                padding: const EdgeInsets.all(0.0),
                margin:
                    const EdgeInsets.symmetric(horizontal: 130.0, vertical: 20),
                child: Container(
                    color: Colors.amber,
                    padding: const EdgeInsets.all(0),
                    child: const Image(image: AssetImage('lib/Images/logo.jpg'))),
              ),
            ),

            //This container is to create a toggle button to switch between the log in and the register page
            Container(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ToggleButtons(
                    isSelected: sign_selections,
                    selectedColor: Colors.black,
                    color: Colors.grey,
                    fillColor: Colors.amber,
                    splashColor: Colors.white54,
                    highlightColor: Colors.red,
                    borderRadius: BorderRadius.circular(50),
                    children: const [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                        child: Text('Log In', style: TextStyle(fontSize: 18)),
                      ),
                      Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 50, vertical: 0),
                          child:
                              Text('Register', style: TextStyle(fontSize: 18))),
                    ],
                    onPressed: (int newindex) {
                      setState(() {
                        for (int index = 0;
                            index < sign_selections.length;
                            index++) {
                          if (index == newindex) {
                            sign_selections[index] = true;
                          } else {
                            sign_selections[index] = false;
                          }
                        }
                      });
                    },
                  )
                ],
              ),
            ),

            //a divider, just for style :3
            // const Divider(
            //   height: 25.0,
            //   thickness: 1.0,
            //   color: Colors.white,
            // ),

            //Logic to switch between the log in and the register pages
            sign_selections[0] ? _log() : _reg(),
          ],
        ),
      ),
    );
  }

  /* ⁡⁢⁣⁣Sing in user with exception for safety.⁡ */
  Future logIn() async {
    final isValid = formKey.currentState!.validate();
    if(!isValid) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: l_emailController.text.trim(),
          password: l_passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  /* ⁡⁢⁣⁣Create user⁡ with exception for safety. */
  Future<void> register() async {
    final isValid = formKey.currentState!.validate();
    if(!isValid) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: r_emailController.text.trim(), password: r_passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);

      Utils.showSnackBar(e.message);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  //Creation of the widget for the log in
  Widget _log() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          /* ⁡⁢⁣⁣EMAIL⁡ textfield. */
          Container(
            padding: const EdgeInsets.fromLTRB(10.0, 18.0, 10.0, 10.0),
            child: TextFormField(
              controller: l_emailController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) => 
                          email != null && !EmailValidator.validate(email)
                            ? 'Enter a Valid Email'
                            : null,
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                contentPadding: EdgeInsets.all(10),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                  width: 1.0,
                )),
                prefixIcon: Icon(Icons.email_rounded),
                prefixIconColor: Colors.amber,
              ),
            ),
          ),
    
          /* ⁡⁢⁣⁣PASSWORD⁡ textfield. */
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: l_passwordController,
              obscureText: true,
              // validator: (value) => 
              //           value != null && value.isEmpty
              //             ? 'Cannot be Empty'
              //             : null,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                contentPadding: EdgeInsets.all(10),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                  width: 1.0,
                )),
                prefixIcon: Icon(Icons.lock),
                prefixIconColor: Colors.amber,
              ),
            ),
          ),
    
          //button to submit the information for the log in
          ElevatedButton.icon(
            onPressed: () {
              /* ⁡⁢⁣⁣Perform login here⁡ */
              logIn();
            },
            icon: const Icon(Icons.login),
            label: const Text('Log In'),
            style: const ButtonStyle(
                fixedSize: MaterialStatePropertyAll(Size(200, 20))),
          ),
        ],
      ),
    );
  }

  //creation of the widget for the register page
  Widget _reg() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            width: 10,
            height: 18.0,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextFormField(
                  controller: r_fnameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => 
                        value != null && value.length < 1
                          ? 'Cannot be Empty'
                          : null,
                  decoration: InputDecoration(
                    hintText: 'First Name',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    contentPadding: EdgeInsets.all(10),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    )),
                    prefixIcon: const Icon(Icons.person_sharp),
                    prefixIconColor: Colors.amber,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  controller: r_lnameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => 
                        value != null && value.length < 1
                          ? 'Cannot be Empty'
                          : null,
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    contentPadding: EdgeInsets.all(10),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.white,
                      width: 1.0,
                    )),
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          // container for the email on the registration page
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: r_emailController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) => 
                        email != null && !EmailValidator.validate(email)
                          ? 'Enter a Valid Email'
                          : null,
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                contentPadding: EdgeInsets.all(10),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                  width: 1.0,
                )),
                prefixIcon: const Icon(Icons.email_rounded),
                prefixIconColor: Colors.amber,
              ),
            ),
          ),
    
          // container for the phone number on the registration page
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: r_phoneController,
              keyboardType: TextInputType.phone,
              autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => 
                        value != null && value.length < 10
                          ? 'Enter a valid Phone Number'
                          : null,
              scrollPadding: EdgeInsets.all(0),
              //obscureText: true,
              decoration: InputDecoration(
                hintText: 'Phone Number',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                contentPadding: EdgeInsets.all(10),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                  width: 1.0,
                )),
                prefixIcon: const Icon(Icons.phone),
                prefixIconColor: Colors.amber,
              ),
            ),
          ),
    
          // Container: ⁡⁢⁣⁣Password on the registration page⁡
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: r_passwordController,
              obscureText: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) => 
                        value != null && value.length < 10
                          ? 'Enter a min of 10 characters'
                          : null,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                contentPadding: EdgeInsets.all(10),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                  width: 1.0,
                )),
                prefixIcon: const Icon(Icons.lock_rounded),
                prefixIconColor: Colors.amber,
              ),
            ),
          ),
    
          // Container: ⁡⁢⁣⁣Confirm password on the registration page⁡
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: r_confirmpasswordController,
              obscureText: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: (value) {
      if (value == null) {
      return null;
      }
      return value == r_passwordController.text
      ? null
      : 'Confirm Password does not match Password';
    },
    
              decoration: InputDecoration(
                hintText: 'Confirm Password',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                contentPadding: EdgeInsets.all(10),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.white,
                  width: 1.0,
                )),
                prefixIcon: const Icon(Icons.lock_rounded),
                prefixIconColor: Colors.amber,
              ),
            ),
          ),
    
          // button to submit the information on the textfields to complete the registration
          ElevatedButton.icon(
            onPressed: () {
              // Perform registration here
              register();
            },
            icon: const Icon(Icons.app_registration),
            label: const Text('Register'),
            style: const ButtonStyle(
                fixedSize: MaterialStatePropertyAll(Size(200, 20))),
          ),
        ],
      ),
    );
  }
}

class Utils{

  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(content: Text(text), backgroundColor: Colors.red);

      messengerKey.currentState!
        ..removeCurrentSnackBar()
        ..showSnackBar(snackBar);
  }
}
