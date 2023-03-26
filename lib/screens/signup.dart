
// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace
import 'package:bookstore/screens/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bookstore/screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:bookstore/util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../homepage.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override

  void initState() {
    super.initState();
    init();
  }

  Widget build(BuildContext context) {
    TextEditingController email=TextEditingController();
    TextEditingController password=TextEditingController();
    return Scaffold(
       backgroundColor :Color.fromARGB(255, 255, 255, 255),
      body: 
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 150.w ,vertical: 100.h),
        child: Column(
          children: [
            Text(
              'SIGN UP',
              style: GoogleFonts.poppins(fontStyle: FontStyle.normal, fontWeight: FontWeight.w600, fontSize: 32,color: Colors.black),
              ),
              verticalSpacing(42.h),
              LoginForm(text: "Email",textEditingController: email,),
              verticalSpacing(42.h),
              LoginForm(text: "Password",textEditingController: password,),
              verticalSpacing(42.h),
              LoginForm(text: "Confirm Password",textEditingController: password,),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
                      signup(email.text, password.text);
  },
                  child: Text('SIGN UP',
                  style: GoogleFonts.poppins(fontStyle: FontStyle.normal, fontWeight: FontWeight.w600,color: Colors.white),),
                )
              ),
          ],
        ),
      ),
    );
  }


}

Future<void> init() async {
  await Firebase.initializeApp();

  Future.delayed(const Duration(milliseconds: 3*1000));(){
    registerforauthStatechanges();
  };
}

void registerforauthStatechanges() {
  FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
}

Future<void> signup(String email, String password) async {
  try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
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

