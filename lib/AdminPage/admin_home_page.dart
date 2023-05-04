import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tnp_cell_pict/AdminPage/admin_add_cource.dart';
import 'package:tnp_cell_pict/AdminPage/admin_add_internship.dart';
import 'package:tnp_cell_pict/AdminPage/admin_add_placement.dart';
import 'package:tnp_cell_pict/screens/Cources/courcescreen.dart';
import 'package:tnp_cell_pict/screens/Internship/Internshipfeed.dart';
import 'package:tnp_cell_pict/screens/News/newsfeed.dart';
import 'package:tnp_cell_pict/screens/home/Job_feed/widgets/jobfeed.dart';
import 'package:tnp_cell_pict/screens/home/homescreen.dart';
import 'package:tnp_cell_pict/screens/home/widgets/BottomNavigationBar.dart';
import 'package:tnp_cell_pict/screens/home/widgets/homeappbar.dart';
import 'package:tnp_cell_pict/screens/home/widgets/joblist.dart';
import 'package:tnp_cell_pict/screens/home/widgets/search_card.dart';
import 'package:tnp_cell_pict/screens/home/widgets/tag_list.dart';

import 'admin_home_screen.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int currIndex=0;
  final screens=[
    AdminHomeScreen(),
    AdminAddJob(),
    Addinternship(),
    Addcource(),
    Addcource()

  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: screens[currIndex],


      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //
      //   },
      //   backgroundColor: Theme.of(context).accentColor,
      //   child: Icon(
      //   Icons.add,
      //   color: Colors.white,
      //   ),
      // ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currIndex,
        onTap: (index)=>setState(() {
          currIndex=index;
        }),

        items: const [
          BottomNavigationBarItem(
            label: 'Stats',
            icon: Icon(Icons.auto_graph_sharp, size: 30,
            ),


          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cases_outlined, size: 30,
            ),
            label: 'Job',

          ),
          BottomNavigationBarItem(
              label: 'Internship',
              icon: Icon(Icons.handyman_outlined, size: 30,)
          ),
          BottomNavigationBarItem(
              label: 'News',
              icon: Icon(Icons.newspaper, size: 30,
              )
          ),
          BottomNavigationBarItem(
              label: 'Courses',
              tooltip: 'Courses',
              icon: Icon(Icons.screen_search_desktop_outlined, size: 30,
              )
          )

        ],
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.fixed,
      ),

    );
  }
}

