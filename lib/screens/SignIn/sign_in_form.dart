import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tnp_cell_pict/AdminPage/admin_screen.dart';
import 'package:tnp_cell_pict/helper/keyboardutil.dart';
import 'package:tnp_cell_pict/screens/Forget_password/ForgetpasswordScreen.dart';
import 'package:tnp_cell_pict/screens/Forget_password/forget_password_screen.dart';
import 'package:tnp_cell_pict/screens/home/home.dart';
import 'package:tnp_cell_pict/helper/formerror.dart';
import '../../constants.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

  final _formKey=GlobalKey<FormState>();
  String ?email;
  String ?password;
  bool remember = false;
  final List<String?>errors=[];

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
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final storage = new FlutterSecureStorage();
  final _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
         children: [
          buildEmailFormField(),
          SizedBox(height: 10,),
          buildPassWordFormField(),
          SizedBox(height: 10,),
          Row(
           children: [
            GestureDetector(
              child: Text("Admin login",
                style: TextStyle(
                decoration: TextDecoration.underline
                ),

              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminSignInScreen()));
              },
            ),
            Spacer(),
            GestureDetector(
            child: Text("Forget Password",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));
            }

            )
           ],
          ),
           FormError(errors:errors),
           SizedBox(height: 10,),

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
                 SignIn(emailController.text, passwordController.text);

               }

               },
               child: Text('Continue'),
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
  TextFormField buildEmailFormField(){
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
        suffixIcon: Icon(Icons.mail_outline_outlined, ),
      ),
    );
  }

  TextFormField buildPassWordFormField(){
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
        return null;
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

void SignIn(String email, String password ) async
{
  if(_formKey.currentState!.validate())
  {
    _auth.signInWithEmailAndPassword(email: email, password: password).then( (value) =>
    {
       Fluttertoast.showToast(msg: "Login Successful"),
       Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()) )

    }).catchError((e){
      Fluttertoast.showToast(msg: e!.messege);

    }
    );
  }

}

}
