import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tnp_cell_pict/screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    );
    return  MaterialApp(
      title: 'T&P Cell PICT',
      theme:  ThemeData(
        primaryColor: Color(0xFF43B1B7),
        accentColor: Color(0xFFFED408)
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

