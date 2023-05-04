import 'package:flutter/cupertino.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("News"),
      ),

    );
  }
}
