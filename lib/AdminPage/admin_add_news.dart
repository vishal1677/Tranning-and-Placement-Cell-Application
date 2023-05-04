import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminNews extends StatefulWidget {
  const AdminNews({Key? key}) : super(key: key);

  @override
  State<AdminNews> createState() => _AdminNewsState();
}

class _AdminNewsState extends State<AdminNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("News"),
      ),
    );
  }
}
