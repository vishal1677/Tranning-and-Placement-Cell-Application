import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourceScreen extends StatefulWidget {
  const CourceScreen({Key? key}) : super(key: key);

  @override
  State<CourceScreen> createState() => _CourceScreenState();
}

class _CourceScreenState extends State<CourceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  height: 100,
                  width: 400,
                  padding: EdgeInsets.all(10),
                  color: Colors.lightBlueAccent,
                  child: Text('1.Flutter - Angela Yu ( Less Time consuming ) : https://mega.nz/folder/rvwg2LKR#g3M_hUo_eyHFehtJ0sBbUg ')
              ),
              Container(
                height:100 ,
                width: 400,
                padding: EdgeInsets.all(10),
                color: Colors.lightGreen,
                child: Text('2. Competitive Programming : Learn Basics of c++ from APNA COLLEGE and basics of CP from a Youtuber "LUV", then start giving codechef contests')
              ),
              Container(
                  height: 100,
                  width: 400,
                  padding: EdgeInsets.all(10),
                  color: Colors.orangeAccent,
                  child: Text('3. Dont forget that your CGPA also matters a lot !!! It is as important as cp and development , keep your cgpa above 9.')
              )
            ],
          )

      ),
    );
  }
}
