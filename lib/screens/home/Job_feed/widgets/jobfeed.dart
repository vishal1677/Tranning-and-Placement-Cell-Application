import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tnp_cell_pict/screens/home/Job_feed/widgets/CategoryList.dart';
import 'package:tnp_cell_pict/screens/home/Job_feed/widgets/jobfeedlist.dart';
import 'package:tnp_cell_pict/screens/home/Job_feed/widgets/searchappbar.dart';
import 'package:tnp_cell_pict/screens/home/Job_feed/widgets/searchinput.dart';

class JobFeedPage extends StatelessWidget {
  const JobFeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     resizeToAvoidBottomInset: false,
     body: Stack(
       children: [
         Row(
           children: [
             Expanded(
               flex: 2,
                 child: Container(
                 )
             ),
             Expanded(
               flex: 1,
                 child: Container(
                   color: Colors.grey.withOpacity(0.1),
                 )
             )
           ],
         ),
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             SearchAppBar(),
             SearchInput(),
             CategoryList(),
             Expanded(child: SearchList())
             
           ],
         )
       ],
     ),

    );
  }
}
