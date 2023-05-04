import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/job.dart';
import '../../widgets/icon_text.dart';

class AdminJobItems extends StatelessWidget {
  final Job job;
  final bool showTime;

  AdminJobItems(this.job, {this.showTime=false});

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
                    child: Image.asset(job.logoUrl),
                  ),
                  SizedBox(width: 10,),
                  Text(job.company,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),

                ],
              ),

            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(job.title,
                style:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ) ,
              ),
              IconText(Icons.monetization_on, job.CTC),

            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconText(Icons.location_on_outlined, job.location),
              if(showTime) IconText(Icons.access_time_outlined, job.starttime)
            ],
          ),
          SizedBox(height: 10,),
          IconText(Icons.people_sharp, "No of Applicants :- ")

        ],
      ),
    );
  }
}