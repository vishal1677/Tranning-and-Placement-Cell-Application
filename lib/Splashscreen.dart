import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tnp_cell_pict/screens/welcome_screen/welcomescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetoHome();
  }
  _navigatetoHome() async{
  
    await Future.delayed(Duration(milliseconds: 3000), (){} );
    Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomePage()));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,

         children: [

           SizedBox(height: 80,),
           Container(
             child: Text("T&P Cell PICT",
               style: TextStyle(
                   fontSize: 28,
                   fontWeight: FontWeight.bold,
                   color: Colors.black
               ),
             ),

           ),

           Container(
             alignment: Alignment.topCenter,
             height: 100,
             width: 100,
             child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/PICTlogo.jpg') ,
             ),
           ),
           SizedBox(height: 30,)


         ],
       ),
      ),
    );
  }
}
