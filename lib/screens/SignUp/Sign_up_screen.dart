import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tnp_cell_pict/screens/SignUp/sign_up_form.dart';

import '../SignIn/Sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

    Widget build(BuildContext context) {
      return SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding:
            EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children:  [
                  SizedBox(height: 20), // 4%
                  Text("Register Account", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  )
                  ),
                  Text(
                    "Complete your details to register as student",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  SignUpForm(),
                  SizedBox(height: 20),
                  SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen())),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.teal),
                      ),
                    ),
                  ],
                )
    ]
            ),
          ),
        ),
      )
      );
  }
}

