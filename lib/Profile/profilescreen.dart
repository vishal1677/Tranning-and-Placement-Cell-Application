import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tnp_cell_pict/screens/Notification/notification.dart';

import '../models/user.dart';
import '../screens/SignIn/Sign_in_screen.dart';
import 'components/profilemenu.dart';
import 'components/profilepic.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  User? user=FirebaseAuth.instance.currentUser;
  UserModel loggedInUser=UserModel();
  final storage=new FlutterSecureStorage();
  @override
  void initState()
  {
    super.initState();
    FirebaseFirestore.instance.collection("users").doc(user!.uid).get().then((value){
      loggedInUser=UserModel.fromMap(value.data());
      setState(() {

      });

    });
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          //facing problem to fecth the first name
          ProfileMenu(
            text:  " ${loggedInUser.firstName} ${loggedInUser.lastName}",
            myicon: Icon(Icons.person),
            press: () => {
            },
          ),
          ProfileMenu(
            text: "${loggedInUser.email}",
            myicon: Icon(Icons.mail_outline_outlined),
            press: () {},
          ),
          ProfileMenu(
            text: "Notifications",
           myicon: Icon(Icons.notifications_none_outlined),
            press: () =>  Navigator.of(context).push(MaterialPageRoute(builder:(context)=> NotificationScreen()),),
          ),
          // ProfileMenu(
          //   text: "Settings",
          //   icon: "assets/icons/Settings.svg",
          //   press: () {},
          // ),
          ProfileMenu(
            text: "Share",
            myicon: Icon(Icons.share),
            press: () {
              //Share.share("com.example.krishak_farma");
              //Share.share("")
            },
          ),
          ProfileMenu(
              text: "Log Out",
              myicon: Icon(Icons.logout),
              press: () async=>{
                await FirebaseAuth.instance.signOut(),
                await storage.delete(key: "uid"),
                // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MobileLogin()), (route) => false)
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SignInScreen()), (route) => false)
              }
          ),
        ],
      ),
    );
  }
// Future<void> logout(BuildContext context) async
// {
//   await FirebaseAuth.instance.signOut();
//   Navigator.pushNamed(context, SignInScreen.routeName);
// }
}


