import 'package:flutter/cupertino.dart';
import 'package:tnp_cell_pict/models/job.dart';
import 'package:tnp_cell_pict/screens/home/widgets/job_items.dart';

class JobList extends StatelessWidget {

  final jobList =Job.generateJobs();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 25,
      ),
      height: 160,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index)=> JobItems(jobList[index]),
          separatorBuilder: (_,index)=> SizedBox(
            width: 15,

          ),
          itemCount: jobList.length),
    );
  }
}
