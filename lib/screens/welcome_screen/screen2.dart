import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 20,),

            Container(
                height: 350,
                width: 350,
                child: Image.asset('assets/images/placement_slider.png',
                  fit: BoxFit.cover,
                )
            ),
            SizedBox(height: 30,),
            Container(
                padding: EdgeInsets.all(20),
                child: Text("Get Realtime Updates and learn Lastest Skills to Crack your next interview",
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
