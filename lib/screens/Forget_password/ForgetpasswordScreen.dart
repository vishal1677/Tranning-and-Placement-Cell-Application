import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'forgetpassword_body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ResetPasswordScreen(),
    );
  }
}
