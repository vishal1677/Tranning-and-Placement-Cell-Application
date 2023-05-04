import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:tnp_cell_pict/Splashscreen.dart';
import 'package:tnp_cell_pict/screens/home/home.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Future<FirebaseApp>_initialization=Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    );
    return FutureBuilder(
      future: _initialization,
        builder: (context,snapshot)
        {
        if(snapshot.hasError) print("Error");
        if(snapshot.connectionState == ConnectionState.done)
          {
            return OverlaySupport(
              child: MaterialApp(
                  title: 'T&P Cell PICT',
                  theme:  ThemeData(
                    primaryColor: Color(0xFF43B1B7),
                    accentColor: Color(0xFFFED408)
                  ),
                  debugShowCheckedModeBanner: false,
                  home: SplashScreen(),

                )
            );
          }

        return CircularProgressIndicator();

        }

    );
    // return  MaterialApp(
    //   title: 'T&P Cell PICT',
    //   theme:  ThemeData(
    //     primaryColor: Color(0xFF43B1B7),
    //     accentColor: Color(0xFFFED408)
    //   ),
    //   debugShowCheckedModeBanner: false,
    //   home: SplashScreen(),
    //
    // );
  }
}

