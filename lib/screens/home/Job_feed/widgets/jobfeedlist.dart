import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tnp_cell_pict/models/job.dart';
import 'package:tnp_cell_pict/screens/home/widgets/job_items.dart';
import 'package:tnp_cell_pict/screens/home/widgets/joblist.dart';

import '../../widgets/job_details.dart';

class SearchList extends StatelessWidget {
  final jobList = Job.generateJobs();


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
              child: JobItems(jobList[index],
                showTime: true,
              ),
              onTap: (){
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (context)=> JobDetail(jobList[index]));
              },
          ),

          separatorBuilder: (_,index)=>SizedBox(height: 20,),
          itemCount: jobList.length
      ),
    );
  }
}
