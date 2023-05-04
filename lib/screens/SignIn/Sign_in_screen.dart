import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tnp_cell_pict/screens/SignIn/sign_in_form.dart';

import 'no_account_text.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
         width: double.infinity,
        child: Padding(
         padding: EdgeInsets.symmetric(horizontal: 20),
         child: SingleChildScrollView(
          child: Column(
           children: [
            SizedBox(height: 10,),
            Text(
              "Welcome Back",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
             Text(
               "Sign in with your email and password  \nor continue as guest",
               textAlign: TextAlign.center,
             ),
             SizedBox(height: 10,),
             SignInForm(),
             SizedBox(height: 10,),
             NoAccountText(),

           ],
          ),
         ),
        ),
        )

    );
  }
}

