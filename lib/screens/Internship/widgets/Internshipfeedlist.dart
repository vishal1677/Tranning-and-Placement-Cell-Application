import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tnp_cell_pict/models/internship.dart';
import 'package:tnp_cell_pict/models/job.dart';
import 'package:tnp_cell_pict/screens/Internship/widgets/InternshipItems.dart';
import 'package:tnp_cell_pict/screens/Internship/widgets/internship_details.dart';
import 'package:tnp_cell_pict/screens/home/widgets/job_items.dart';
import 'package:tnp_cell_pict/screens/home/widgets/joblist.dart';

class InternshipSearchList extends StatelessWidget {
  final internList = Internship.generateInternship();



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 25,
      ),
      child: ListView.separated(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(
            left: 25,
            right: 25,
            bottom: 25
          ),
          itemBuilder: (context,index)=>GestureDetector(
              child: InternshipItems(internList[index],
                showTime: true,
              ),
            onTap:() {
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => InternDetail(internList[index]));
            },
          ),
          separatorBuilder: (_,index)=>SizedBox(height: 20,),
          itemCount: internList.length
      ),
    );
  }
}
