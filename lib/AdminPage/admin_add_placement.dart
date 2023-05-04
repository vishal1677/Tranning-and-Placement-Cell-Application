import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tnp_cell_pict/AdminPage/AdminJob/add_job_details.dart';
import 'package:tnp_cell_pict/AdminPage/AdminJob/add_job_page.dart';

import '../models/job.dart';
import '../screens/home/widgets/job_details.dart';
import '../screens/home/widgets/job_items.dart';
import 'AdminJob/admin_job_detail.dart';
import 'AdminJob/admin_job_items.dart';
import 'admin_home_page.dart';


class AdminAddJob extends StatelessWidget {
  const AdminAddJob({Key? key}) : super(key: key);

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
              // CategoryList(),
              Expanded(child: SearchList())

            ],
          )
        ],
      ),

    );
  }
}

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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminHomePage()));

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
            "Add Jobs",
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
                    // Icon(
                    //   Icons.notifications_none_outlined,
                    //   size: 30,
                    //   color: Colors.grey,
                    // ),
                    // Positioned(
                    //   child: Container(
                    //     padding: EdgeInsets.all(4),
                    //     decoration: BoxDecoration(
                    //         color: Colors.red,
                    //         shape: BoxShape.circle
                    //     ),
                    //   ),
                    //   top: 0,
                    //   right: 0,
                    // )
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
class SearchInput extends StatelessWidget {
  const SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      child: Row(
        children: [
          Expanded(child: TextField(
            cursorColor: Colors.grey,
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none
                ),
                hintText: "Search",
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 18
                ),
                contentPadding: EdgeInsets.zero,
                prefixIcon: Container(
                  padding: EdgeInsets.all(15),
                  child: Image.asset("assets/icons/search.png", width: 20,),
                )
            ),
          )
          ),
          SizedBox(width: 10,),
          // Container(
          //     height: 50,
          //     width: 50,
          //     padding: EdgeInsets.all(13),
          //
          //     decoration: BoxDecoration(
          //       color: Theme.of(context).accentColor,
          //       borderRadius: BorderRadius.circular(30),
          //     ),
          //     child:Image.asset('assets/icons/filter.png', width: 20,)
          // )
          FloatingActionButton(
            onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>AddJobDetails()));
            },
            backgroundColor: Theme.of(context).accentColor,
            child: Icon(
            Icons.add,
            color: Colors.white,
            ),
          ),
        ],
      ),

    );
  }
}

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final tagList = <String>['Latest', 'Applied', 'Archived'];
  var selected=0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 13
      ),
      height: 40,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index)=>GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20
              ),
              decoration: BoxDecoration(
                  color: selected == index ? Theme.of(context).primaryColor.withOpacity(0.5): Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: selected== index ? Theme.of(context).primaryColor : Theme.of(context).primaryColor.withOpacity(0.2)

                  )
              ),

              child: Text(tagList[index]),
            ),
            onTap: (){
              setState(() {
                selected=index;
              });
            },
          ),
          separatorBuilder: (_,index)=> SizedBox(width: 15,),
          itemCount: tagList.length),
    );
  }
}
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
            child: AdminJobItems(jobList[index],
              showTime: true,
            ),
            onTap: (){
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  builder: (context)=> AdminJobDetail(jobList[index]));

            },
          ),

          separatorBuilder: (_,index)=>SizedBox(height: 20,),
          itemCount: jobList.length
      ),
    );
  }
}

