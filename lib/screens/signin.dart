
// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:bookstore/homepage.dart';
import 'package:bookstore/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bookstore/util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
//import 'package:bookstore/authentication.dart';

 TextEditingController email=TextEditingController();
    TextEditingController password=TextEditingController();

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor :Color.fromARGB(255, 255, 255, 255),
      body: 
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 150.w ,vertical: 100.h),
        child: Column(
          children: [
            Text(
              'SIGN IN',
              style: GoogleFonts.poppins(fontStyle: FontStyle.normal, fontWeight: FontWeight.w600, fontSize: 32,color: Colors.black),
              ),
              verticalSpacing(42.h),
              LoginForm(text: "Email",textEditingController: email,),
              verticalSpacing(42.h),
              LoginForm(text: "Password",textEditingController: password,),
              verticalSpacing(42.h),
              Container(
                height: 50.h ,
                width:90.w ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.black,
                  ),
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                   },
                  child: Text('SIGN IN',
                  style: GoogleFonts.poppins(fontStyle: FontStyle.normal, fontWeight: FontWeight.w600,color: Colors.white),),
                )
              ),
              verticalSpacing(42.h),
              GestureDetector(
                child: Text("Don't Have an account? Sign Up"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                },
              ),
              verticalSpacing(10.h),
              Text(
                  "Forgot Password",
                  style: GoogleFonts.poppins(fontStyle: FontStyle.normal,fontSize: 12)
                  ),
          ],
        ),
      ),
    );
  }
}



class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key, required this.text, required this.textEditingController,
  });
final String text;
final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h ,
      width:90.w ,
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          labelText: text,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black,),
            borderRadius: BorderRadius.all(Radius.circular(10),),
          ),
        ),
      ),
    );
  }
}