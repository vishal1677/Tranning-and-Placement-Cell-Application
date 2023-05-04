import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CourceScreen extends StatefulWidget {
  const CourceScreen({Key? key}) : super(key: key);

  @override
  State<CourceScreen> createState() => _CourceScreenState();
}

class _CourceScreenState extends State<CourceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Courses"),
        ),
      ),
    );
  }
}
