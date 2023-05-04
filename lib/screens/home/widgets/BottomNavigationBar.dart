import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home, size: 25,
            )
        ),
        BottomNavigationBarItem(
            label: 'Job',
            icon: Icon(Icons.cases_outlined, size: 25,
            )
        ),
        BottomNavigationBarItem(
            label: 'Internship',
            icon: Icon(Icons.handyman_outlined, size: 25,)
        ),
        BottomNavigationBarItem(
            label: 'News',
            icon: Icon(Icons.newspaper, size: 25,
            )
        ),
        BottomNavigationBarItem(
            label: 'Courses',
            tooltip: 'Courses',
            icon: Icon(Icons.screen_search_desktop_outlined, size: 25,
            )
        )

      ],
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Theme.of(context).primaryColor,
      type: BottomNavigationBarType.fixed,
    );
  }
}
