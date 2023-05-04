import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tnp_cell_pict/screens/home/home.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 25,
        right: 25
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle
              ),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            "Jobs",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,

            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30, right: 10),
                transform: Matrix4.rotationZ(100),
                child: Stack(
                  children: [
                    Icon(
                      Icons.notifications_none_outlined,
                      size: 30,
                      color: Colors.grey,
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
             Icon(Icons.more_horiz)
            ],
          )
        ],
    ),

    );
  }
}
