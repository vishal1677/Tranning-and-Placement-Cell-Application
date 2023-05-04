import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Addinternship extends StatefulWidget {
  const Addinternship({Key? key}) : super(key: key);

  @override
  State<Addinternship> createState() => _AddinternshipState();
}

class _AddinternshipState extends State<Addinternship> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("Add Internship"),
      ),
    );
  }
}
