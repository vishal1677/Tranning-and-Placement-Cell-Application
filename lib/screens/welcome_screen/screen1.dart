import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 20,),
          
          Container(
            height: 400,
            width: 400,
              child: Image.asset('assets/images/placement_success.png',
                fit: BoxFit.cover,
              )
          ),
          SizedBox(height: 30,),
          Container(
            padding: EdgeInsets.all(20),
              child: Text("We Give Realtime Updates for Your Upcoming Job and Internship Opporutunity",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              )
          ),
          SizedBox(height: 20,)
        ],
      )
    );
  }
}
