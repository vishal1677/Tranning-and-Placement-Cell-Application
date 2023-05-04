import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tnp_cell_pict/screens/welcome_screen/screen1.dart';
import 'package:tnp_cell_pict/screens/welcome_screen/screen2.dart';
import 'package:tnp_cell_pict/screens/welcome_screen/screen3.dart';

class WelcomePage extends StatefulWidget {

  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  List pages = [
    Screen1(),
    Screen2(),
    Screen3()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (_,index){
          return pages[index];
           
          }
      ),
    );
  }
}
