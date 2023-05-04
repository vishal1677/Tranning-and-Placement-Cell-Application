import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InternshipCategoryList extends StatefulWidget {
  const InternshipCategoryList({Key? key}) : super(key: key);

  @override
  State<InternshipCategoryList> createState() => _InternshipCategoryListState();
}

class _InternshipCategoryListState extends State<InternshipCategoryList> {
  final tagList = <String>['Latest', 'Applied', 'Archived'];
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
                  color: selected == index ? Theme.of(context).primaryColor.withOpacity(0.5): Colors.white,
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
