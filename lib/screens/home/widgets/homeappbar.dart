import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tnp_cell_pict/Profile/profilescreen.dart';
import 'package:tnp_cell_pict/screens/Notification/notification.dart';
import 'package:tnp_cell_pict/screens/welcome_screen/screen1.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 28,
        right: 28
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15,),
              Text("Welcome to T&P Cell PICT", style: TextStyle(
                color:Colors.grey,
                fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: 10,),
              Text("Vishal Patil",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30, right: 10),
                transform: Matrix4.rotationZ(100),
                child: Stack(
                  children: [
                    GestureDetector(
                      child: Icon(
                        Icons.notifications_none_outlined,
                        size: 30,
                        color: Colors.grey,
                      ),
                      onTap: (){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>NotificationScreen())
                         );
                      },
                    ),
                    Positioned(
                      child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle
                      ),
                    ),
                      top: 0,
                      right: 0,
                    )
                  ],
                ),
              ),
              SizedBox(width: 20,),
              GestureDetector(
                child: ClipOval(
                  child: Image.asset('assets/images/avatar.png',width: 40,),

                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
                },
              )
            ],
          )
        ],
      ) ,
    );
  }
}
