
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddJobPage extends StatefulWidget {
  const AddJobPage({Key? key}) : super(key: key);

  @override
  State<AddJobPage> createState() => _AddJobPageState();
}

class _AddJobPageState extends State<AddJobPage> {

  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyTitleController = TextEditingController();
  TextEditingController companyCTCController = TextEditingController();
  TextEditingController companyLocationController = TextEditingController();
  DateTime startDate = DateTime.now();
  String logoUrl='';
  String ?gender;
  String ?branch;
  List branchOption=[
    'CS', 'IT', 'EnTc','All'
  ];

  List genderOption=[
    'Male', 'Female', 'All'
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            backgroundContainer(context),
            Positioned(
                top: 120,
                child: SingleChildScrollView(
                  child: SizedBox(
                      child: mainContainer()
                  ),
                )
                ),

          ],
        ),

      ),
    );
  }

  Container mainContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      height: 1000,
      width: 340,
        child: Column(
          children: [
            SizedBox(height: 30),
            companyName(),
            SizedBox(height: 30),
            companyTitle(),
            SizedBox(height: 30),
            companyCTC(),
            SizedBox(height: 30),
            companyLocation(),
            SizedBox(height: 30),
            startTime(),
            SizedBox(height: 30),
            UploadLogo(),
            SizedBox(height: 10),
            Save(),
            companyLocation(),



          ],
        ),
    

    );
  }

  Column backgroundContainer(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 240,
          decoration: BoxDecoration(
              color: Theme
                  .of(context)
                  .primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)
              )
          ),
          child: Column(
            children: [
              SizedBox(height: 40,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white,),
                    ),
                    Text(
                      'Add Job',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    Icon(
                      Icons.attach_file_outlined,
                      color: Colors.white,
                    )

                  ],
                ),
              )
            ],
          ),
        ),

      ],
    );

  }

    Padding companyName() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextField(
          //focusNode: ex,
          //controller: expalin_C,// here for storing the name of farmer modify code later
          controller: companyCTCController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            labelText: 'Enter Company name',
            labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    width: 2, color: Colors.teal)),
            suffixIcon: Icon(Icons.person),
          ),
        ),
      );
    }
  Padding companyTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        //focusNode: ex,
        //controller: expalin_C,// here for storing the name of farmer modify code later
        controller: companyTitleController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'Enter Position of Job',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  width: 2, color: Colors.teal)),
          suffixIcon:Icon(Icons.cases_outlined),
        ),
      ),
    );
  }
  Padding companyCTC() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        //focusNode: ex,
        //controller: expalin_C,// here for storing the name of farmer modify code later
        controller: companyCTCController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'Enter CTC in LPA',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  width: 2, color: Colors.teal)),
          suffixIcon: Icon(Icons.monetization_on),
        ),
      ),
    );
  }
  Padding companyLocation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        //focusNode: ex,
        //controller: expalin_C,// here for storing the name of farmer modify code later
        controller: companyLocationController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: 'Enter company location',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  width: 2, color: Colors.teal)),
          suffixIcon: Icon(Icons.location_on_outlined),
        ),
      ),
    );
  }

  Widget startTime() {
    return Container(
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Color(0xffC5C5C5))),
      width: 300,
      child: TextButton(
        onPressed: () async {
          DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: startDate,
              firstDate: DateTime(2020),
              lastDate: DateTime(2100));
          if (newDate == Null) return;
          setState(() {
           startDate = newDate!;
          });
        },
        child: Text(
          'Approximate starting date :  ${startDate.day}/${startDate.month}/${startDate.year}',
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Padding Branch()
  {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.only(left: 16,right: 16),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(16)
        ),
        child: DropdownButton(
            value: branch,
            underline: SizedBox(),
            dropdownColor: Colors.white,
            isExpanded: true,
            style: TextStyle(
                fontSize: 16
            ),
            hint: Text("Select Branch"),
            items: branchOption.map((valueItem){
              return DropdownMenuItem(
                value: valueItem,
                child: Text(valueItem, style: TextStyle(color: Colors.black,fontSize: 16 ),),

              );
            }).toList(),
            onChanged: (newvalue)
            {
              setState(() {
                branch=newvalue.toString();
              });
            }
        ),
      ),
    );
  }

  Padding Gender()
  {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.only(left: 10,right: 10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(16)
        ),
        child: DropdownButton(
            value: gender,
            underline: SizedBox(),
            dropdownColor: Colors.white,
            isExpanded: true,
            style: TextStyle(
                fontSize: 16
            ),
            hint: Text("Select Gender"),
            items: genderOption.map((valueItem){
              return DropdownMenuItem(
                value: valueItem,
                child: Text(valueItem, style: TextStyle(fontSize: 16, color: Colors.black),),

              );
            }).toList(),
            onChanged: (newvalue)
            {
              setState(() {
                gender=newvalue.toString();
              });
            }
        ),
      ),
    );
  }

  Container UploadLogo(){

    return Container(
  margin: EdgeInsets.symmetric(vertical: 20),
  height: 45,
  width: 330,
  child: ElevatedButton(
  onPressed: () {


  },
  child: Text('Upload Logo'),
  style: ElevatedButton.styleFrom(
  elevation: 0,
  primary: Theme.of(context).primaryColor,
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(20)
  )
  ),

  ),
  );

  }


  Container Save(){

    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 45,
      width: 330,
      child: ElevatedButton(
        onPressed: () {


        },
        child: Text('Save details'),
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            )
        ),

      ),
    );

  }

}
