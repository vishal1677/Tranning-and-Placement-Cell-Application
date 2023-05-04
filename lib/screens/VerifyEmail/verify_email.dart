import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tnp_cell_pict/screens/home/home.dart';

import '../SignUp/Sign_up_screen.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();

}


class _VerifyEmailState extends State<VerifyEmail> {

  final auth = FirebaseAuth.instance;
  User ?user;
  Timer ?timer;
  bool isVerified= false;


  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 100), (){
    }
    );



  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Email Verification"),
        backgroundColor: Colors.teal,
      ),
      body:
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),

            Text(
              "Please Verify your Email to continue  ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height:30),
            Text("Please click on button below to send verification link ",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: () async {
                user=auth.currentUser;

                user?.sendEmailVerification().then((value){
                  Fluttertoast.showToast(msg: "Email Sent successfully");
                });
              },
              child: const Text("Vefiry Email "),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Please click below if you have verified mail using link ",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed:() async {

                user?.reload();
                user = auth.currentUser;
                bool? val = user?.emailVerified;
                if(val!){

                  setState(() {
                    isVerified=true;
                  });

                  Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                }
                else
                {
                  Fluttertoast.showToast(msg: "You haven't verified email please verify first");
                }

              },
              child: Text("I have verified email "),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
              ),

            ),

            SizedBox(height: 50,),

            Text(
              "The verification will be expired within ",
              style: TextStyle(
                  fontSize: 18
              ),
            ),
            buildTimer(),

          ],
        ),
      ),
    );
  }

  Future<void> checkEmailverified() async {

    user=auth.currentUser;
    await user?.reload();
    bool? val = user?.emailVerified;

    if(val!){

      timer?.cancel();
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }
  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
              const EdgeInsets.all(8.0),
              child: TweenAnimationBuilder(

                tween: Tween(begin: 100.0, end: 0.0),
                duration: Duration(seconds: 100),
                builder: (_, dynamic value, child) => Text(
                  "00:${value.toInt()}",
                  style: TextStyle(color: Theme.of(context).primaryColor,
                    fontSize: 20,
                  ),

                ),
              ),
            ),
          ],
        ),
      ],
    );
  }




}