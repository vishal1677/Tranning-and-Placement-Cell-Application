import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tnp_cell_pict/screens/SignIn/Sign_in_screen.dart';
import 'package:tnp_cell_pict/screens/home/home.dart';
import 'package:tnp_cell_pict/screens/home/homescreen.dart';

class Screen3 extends StatefulWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 20,),

            Container(
              alignment: Alignment.center,
                height: 350,
                width: 350,
                child: Image.asset('assets/images/discussion.png',
                  fit: BoxFit.cover,
                )
            ),
            SizedBox(height: 30,),
            Container(
                padding: EdgeInsets.all(20),
                child: Text("Get Realtime Statistics to Improve",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                )
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 25),
              height: 45,
              width: 330,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));

                },
                child: Text('Lets get  Started'),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),

              ),
            )
          ],
        )
    );
  }
}
