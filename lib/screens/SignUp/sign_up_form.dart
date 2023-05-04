// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tnp_cell_pict/models/user.dart';
import 'package:tnp_cell_pict/screens/VerifyEmail/verify_email.dart';
import 'package:tnp_cell_pict/screens/home/home.dart';

import '../../constants.dart';
import '../../helper/keyboardutil.dart';
class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  final _auth = FirebaseAuth.instance;
  final _formKey=GlobalKey<FormState>();
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? conformPassword;
  String? registrationId;
  String? rollNo;
  String? year;
  String? branch;
  String? gender;

  List yearOption=[
   '1st', '2nd', '3rd','4th'
  ];
  List branchOption=[
    'CS', 'IT', 'EnTc'
  ];

  List genderOption=[
    'Male', 'Female', 'Prefer Not to say'
  ];
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  TextEditingController registrationIdController = new TextEditingController();
  TextEditingController rollNoController = new TextEditingController();
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }



  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(

          children: [
            FirstName(),
            SizedBox(height: 20,),
            LastName(),
            SizedBox(height: 20,),
            RegistrationID(),
            SizedBox(height: 20,),
            Year(),
            SizedBox(height: 20,),
            Branch(),
            SizedBox(height: 20,),
            Gender(),
            SizedBox(height: 20,),
            RollNo(),
            SizedBox(height: 20,),
            Email(),
            SizedBox(height: 20,),
            Password(),
            SizedBox(height: 20,),
            ConfirmPassword(),
            SizedBox(height: 20,),

            Container(
              margin: EdgeInsets.symmetric(vertical: 25),
              height: 45,
              width: 330,
              child: ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate())
                  {
                    _formKey.currentState!.save();
                    KeyboardUtil.hideKeyboard(context);
                    SignUp(emailController.text, passwordController.text);
                  }

                },
                child: Text('Register Account'),
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),

              ),
            )
          ],
        )

    );

  }
  TextFormField FirstName(){
    return TextFormField(
      autofocus: false,
      controller: firstNameController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex=new RegExp(r'^.{3,}$');
        if(value!.isEmpty){
          return ("First Name cannot be Empty ");

        }
        // if(!regex.hasMatch(value)){
        //   return {"Enter valid name(Min. 3 Character)"};
        // }
        return null;
      },
      onSaved: (value){
        firstName=value!;
        firstNameController.text=value!;
      },

      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),

        labelText: "Name",
        labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
        hintText: "Enter your Name",

        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Colors.teal)),
        suffixIcon: Icon(Icons.person_add_alt_1_sharp),
      ),
    );
  }
  TextFormField LastName()
  {
     return TextFormField(

       autofocus: false,
       controller: lastNameController,
       keyboardType: TextInputType.name,
       validator: (value) {

         if(value!.isEmpty){
           return ("First Name cannot be Empty ");

         }
         return null;
       },

       onSaved: (value){
         lastName=value!;
         lastNameController.text=value!;
       },
       decoration: InputDecoration(
         contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
         labelText: "Surname",
         labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
         hintText: "Enter your SurName",

         floatingLabelBehavior: FloatingLabelBehavior.always,
         enabledBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(10),
             borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
         focusedBorder: OutlineInputBorder(
             borderRadius: BorderRadius.circular(10),
             borderSide: BorderSide(width: 2, color: Colors.teal)),
         //suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
       ),
     );
  }
  TextFormField Email()
  {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue){
        email = newValue;
        emailController.text=newValue!;

      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        labelText: "Email",
        labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Colors.teal)),
        suffixIcon: Icon(Icons.mail_outline),
      ),
    );
  }
  TextFormField Password()
  {
    return TextFormField(
      obscureText: true,
      controller: passwordController,
      onSaved: (newValue){
        password = newValue;
        passwordController.text=newValue!;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        labelText: "Password",
        labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Colors.teal)),
        suffixIcon: Icon(Icons.lock_open_outlined),
      ),


    );
  }
  TextFormField ConfirmPassword()
  {
    return TextFormField(
      obscureText: true,
      controller: confirmPasswordController,
      onSaved: (newValue) {
        conformPassword = newValue;
        confirmPasswordController.text=newValue!;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == conformPassword) {
          removeError(error: kMatchPassError);
        }
        conformPassword = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        labelText: "Confirm Password",
        labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
        hintText: "Re-enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Colors.teal)),
        suffixIcon: Icon(Icons.lock_open_outlined),
      ),

    );
  }

  TextFormField RegistrationID()
  {
    return TextFormField(
      autofocus: false,
      controller: registrationIdController,
      keyboardType: TextInputType.text,
      validator: (value) {
        RegExp regex=new RegExp(r'^.{3,}$');
        if(value!.isEmpty){
          return ("Registration ID cannot be Empty ");

        }
        // if(!regex.hasMatch(value)){
        //   return {"Enter valid name(Min. 3 Character)"};
        // }
        return null;
      },
      onSaved: (value){
        registrationId=value!;
        registrationIdController.text=value!;
      },

      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),

        labelText: "Registration ID",
        labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
        hintText: "Enter your Registration ID",

        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Colors.teal)),
        suffixIcon: Icon(Icons.person_add_alt_1_sharp),
      ),

    );
  }
  TextFormField RollNo()
  {
    return TextFormField(
      autofocus: false,
      controller: rollNoController,
      keyboardType: TextInputType.number,
      validator: (value) {
        RegExp regex=new RegExp(r'^.{3,}$');
        if(value!.isEmpty){
          return ("Roll Number cannot be Empty ");

        }
        if(value.length != 5)
        {
          return ("Roll Number should be of 5 digits");
        }
        // if(!regex.hasMatch(value)){
        //   return {"Enter valid name(Min. 3 Character)"};
        // }
        return null;
      },
      onSaved: (value){
        rollNo=value!;
        rollNoController.text=value!;
      },

      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),

        labelText: "Roll Number",
        labelStyle: TextStyle(fontSize: 17, color: Colors.grey.shade500),
        hintText: "Enter your Roll Number",

        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Color(0xffC5C5C5))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 2, color: Colors.teal)),
        suffixIcon: Icon(Icons.format_list_numbered_outlined),
      ),
    );
  }

  Padding Year()
  {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.only(left: 16,right: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(16)
        ),
        child: DropdownButton(
            value: year,
            underline: SizedBox(),
            isExpanded: true,
            style: TextStyle(
              fontSize: 16
            ),
            hint: Text("Select Year"),
            items: yearOption.map((valueItem){
             return DropdownMenuItem(
                 value: valueItem,
                 child: Text(valueItem, style: TextStyle(color: Colors.black, fontSize: 16),
                 ),
             );
            }).toList(),
            onChanged: (newvalue)
            {
              setState(() {
                year=newvalue.toString();
              });
            }
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

  Future<void> SignUp(String email, String password)
  async {
    if(_formKey.currentState!.validate())
    {
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) => {
        postDetailstoFirestore(),

      }).catchError((e){
        Fluttertoast.showToast(msg: e!.message);
      });
    }

  }

 postDetailstoFirestore() async
 {
   FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
   User ?user = _auth.currentUser;
   UserModel userModel = UserModel();
   userModel.uid=user!.uid;
   userModel.email=user.email;
   userModel.firstName=firstNameController.text;
   userModel.lastName=lastNameController.text;
   userModel.rollNo=rollNoController.text;
   userModel.registrationId=registrationIdController.text;
   userModel.year=year;
   userModel.gender=gender;
   userModel.branch=branch;

   await firebaseFirestore.collection("users").doc(user.uid).set(userModel.toMap()).then((value) =>
       Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyEmail()))
   );



 }



}
