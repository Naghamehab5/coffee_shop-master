// ignore_for_file: avoid_print


import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coffee_shop/home_page.dart';
import 'package:coffee_shop/registration/password_recovery.dart';
import 'package:coffee_shop/registration/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constant/flatbuton.dart';
import '../constant/loading.dart';
import '../constant/logo.dart';
import '../constant/styles.dart';
import '../constant/texfield.dart';
import '../constant/txtbutton.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  signIn() async {
    var formdata = _formKey.currentState;
    if (formdata!.validate()) {
      formdata.save();
      try {
        showLoading(context);
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        return userCredential;
      } on FirebaseAuthException catch (e) {
        print(e.code);
        if (e.code == 'user-not-found') {
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              title: "Error",
              body: const Text("this account dosen\'t exist"))
            .show();
        } else if (e.code == 'wrong-password') {
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              title: "Error",
              body: const Text("wrong password"))
            .show();
        }
        else if (e.code == 'invalid-email'){
          Navigator.of(context).pop();
          AwesomeDialog(
              context: context,
              title: "Error",
              body: const Text("The email was entered incorrectly"))
              .show();
        }
      }
    } else {
      return "Not Valid";
    }
  }



  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: [
            const SizedBox(height: 35),
            const Logo(
            height: 140,
          ),
            const SizedBox(
        height: 30,
      ),
      Center(
          child: Text(
            'Login',
            style: labelStyle,
          )),
            const SizedBox(
        height: 20,
      ),
      Form(
          key: _formKey,
          child: Column(
            children: [
              InputFieldRegist(
                onChanged: (val) {
                  email = val;
                },
                hint: 'enter e-mail',
                label: 'E-mail',
                scure: false,
                validator: (value) {
                  email = value;
                  if (value!.isEmpty) {
                    return 'enter your e-mail please ';
                  }
                  if(!value.toString().contains('@')){
                    return ' Please enter a valid e-mail, it must contain @';
                  }
                  else if(!value.toString().contains('.com')){
                    return 'Please enter a valid email. It should be like user@mail.com';
                  }
                 // else if(!value.toString().contains('gmail')){
                 //    return 'الرجاء ادخال البريد الالكتروني بشكل صحيح يجب ان يحتوي  gmail or mail or yahoo';
                 //  }
                 //  else if(!value.toString().contains('yahoo')){
                 //    return 'الرجاء ادخال البريد الالكتروني بشكل صحيح يجب ان يحتوي  gmail or mail or yahoo';
                 //  }
                 //  else if(!value.toString().contains('admin1')){
                 //    return 'الرجاء ادخال البريد الالكتروني بشكل صحيح يجب ان يحتوي  gmail or mail or yahoo';
                 //  }
                },

              ),
              InputFieldRegist(
                onChanged: (val) {
                  password = val;
                },
                hint: 'enter password',
                label: 'password',
                scure: true,
                validator: (value) {
                  password = value;
                  if (value!.isEmpty) {
                    return 'enter your password please ';
                  }
                },

              ),
            ],
          )),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Textbuton('forget password ?', onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PasswordRecovery()));
            })
          ],
        ),
      ),
      SizedBox(
        height: sizeFromHeight(context, 20),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Don\'t have an account?',
            style: hintStyle,
          ),
          SizedBox(
            height: sizeFromHeight(context, 15),
          ),
          Textbuton(
            'create account',
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SignInScreen()));
            },
          ),
        ],
      ),
      Buton("login", onTap: ()async {
             await loginNavigate(context);
            },),
        ],
      ),
    );
  }
  loginNavigate(context)async{
    var user = await signIn();

     if(user != null){
      Navigator.of(context).popUntil((route) => route.isFirst);
      await  Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>  MyHomePage()));
    }
  }
}

