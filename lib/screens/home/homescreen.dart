import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tnp_cell_pict/screens/home/widgets/homeappbar.dart';
import 'package:tnp_cell_pict/screens/home/widgets/joblist.dart';
import 'package:tnp_cell_pict/screens/home/widgets/search_card.dart';
import 'package:tnp_cell_pict/screens/home/widgets/tag_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
