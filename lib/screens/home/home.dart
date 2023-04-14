import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tnp_cell_pict/screens/home/widgets/homeappbar.dart';
import 'package:tnp_cell_pict/screens/home/widgets/joblist.dart';
import 'package:tnp_cell_pict/screens/home/widgets/search_card.dart';
import 'package:tnp_cell_pict/screens/home/widgets/tag_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body: Stack(
       children: [
         Row(
           children: [
             Expanded(flex: 2,
               child: Container(),
             ),
             Expanded(flex: 1,
               child: Container(
                 color: Colors.grey.withOpacity(0.1),
               ),
             )
           ],
         ),
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             HomeAppBar(),
             SearchCard(),
             Taglist(),
             JobList(),

           ],
         )
       ],
     ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(
        Icons.add,
        color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home, size: 25,
              )
          ),
          BottomNavigationBarItem(
              label: 'Cases',
              icon: Icon(Icons.cases_outlined, size: 25,
              )
          ),
          BottomNavigationBarItem(
              label: '',
              icon: Text('',
              )
          ),
          BottomNavigationBarItem(
              label: 'Chat',
              icon: Icon(Icons.chat_outlined, size: 25,
              )
          ),
          BottomNavigationBarItem(
              label: 'Person',
              icon: Icon(Icons.person, size: 25,
              )
          )

        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.fixed,
      ),

    );
  }
}
