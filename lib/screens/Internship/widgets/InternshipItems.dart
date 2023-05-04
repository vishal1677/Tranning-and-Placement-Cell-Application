import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tnp_cell_pict/models/internship.dart';
import 'package:tnp_cell_pict/models/job.dart';
import 'package:tnp_cell_pict/widgets/icon_text.dart';

class InternshipItems extends StatelessWidget {
  final Internship intern;
  final bool showTime;

  InternshipItems(this.intern, {this.showTime=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.1)
                    ),
                    child: Image.asset(intern.logoUrl),
                  ),
                  SizedBox(width: 10,),
                  Text(intern.company,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),

                ],
              ),
              Icon(intern.isMark ? Icons.bookmark : Icons.bookmark_outline_outlined,
                color: intern.isMark ? Theme.of(context).primaryColor : Colors.black,
              )
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(intern.title,
                style:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ) ,
              ),
            ],
          ),
          SizedBox(height: 10,),
          IconText(Icons.monetization_on, intern.stipend),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconText(Icons.location_on_outlined, intern.location),
              if(showTime) IconText(Icons.access_time_outlined, intern.startTime)
            ],
          )

        ],
      ),
    );
  }
}
