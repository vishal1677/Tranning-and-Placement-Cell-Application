import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Taglist extends StatefulWidget {
  const Taglist({Key? key}) : super(key: key);

  @override
  State<Taglist> createState() => _TaglistState();
}

class _TaglistState extends State<Taglist> {
  final tagList = <String>['All', '🌟 Full Time', '⚡Internship'];
  var selected=0;

  @override
  Widget build(BuildContext context) {
   return Container(
     padding: EdgeInsets.symmetric(
       horizontal: 13
     ),
     height: 40,
     child: ListView.separated(
         scrollDirection: Axis.horizontal,
         itemBuilder: (context, index)=>GestureDetector(
           child: Container(
             padding: EdgeInsets.symmetric(
               vertical: 10,
               horizontal: 20
             ),
             decoration: BoxDecoration(
               color: selected == index ? Theme.of(context).primaryColor.withOpacity(0.2): Colors.white,
               borderRadius: BorderRadius.circular(20),
               border: Border.all(
                 color: selected== index ? Theme.of(context).primaryColor : Theme.of(context).primaryColor.withOpacity(0.2)

               )
             ),
             
             child: Text(tagList[index]),
           ),
           onTap: (){
             setState(() {
               selected=index;
             });
           },
         ),
         separatorBuilder: (_,index)=> SizedBox(width: 15,),
         itemCount: tagList.length),
   );
  }
}
