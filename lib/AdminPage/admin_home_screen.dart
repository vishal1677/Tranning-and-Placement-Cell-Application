import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../screens/SignIn/Sign_in_screen.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  final storage=new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: GestureDetector(
          child: Icon(Icons.logout,

          ),
          onTap: () async=>{
            await FirebaseAuth.instance.signOut(),
            await storage.delete(key: "uid"),
            // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MobileLogin()), (route) => false)
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SignInScreen()), (route) => false)

          },
        ),
        title: Text("Welcome Admin"),
      ),
      body: Container(
        child: Center(
          child: Text("Home"),
        ),
      ),
    );
  }
}
