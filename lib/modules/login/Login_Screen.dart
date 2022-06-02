import 'dart:io';
import 'package:flutter/material.dart';
import '../../btn.dart';
import '../../shared/component/constants.dart';


class Login_Screen extends StatefulWidget{
  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  var emailcontroller = TextEditingController();

  var passwordcontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();

  bool ispasswordshow = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 37, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 38,
                  ),

                  // text form field email
                  defaultformfield(
                      controller: emailcontroller,
                      type: TextInputType.emailAddress,
                      Validate: (value){
                        if(value.isEmpty)
                          return 'email address must not be empty';
                        return null;
                      },
                      LabelText: 'Please Enter Email',
                      iconprefix: Icons.email,

                  ),
                  SizedBox(
                    height:  19,
                  ),

                  // text form field password
                  defaultformfield(
                      controller: passwordcontroller,
                      type: TextInputType.visiblePassword ,
                      Validate: (value){
                        if(value.isEmpty){
                          return 'password must not be empty';
                        }else {
                          return null;
                        }
                      },
                      LabelText: 'enter password',
                      ispassword: ispasswordshow,
                      suffixpressed: (){
                        setState(() {
                          ispasswordshow = !ispasswordshow;
                        });

                      },
                      iconprefix: Icons.lock,
                      iconsuffix: ispasswordshow? Icons.visibility :Icons.visibility_off
                  ),
                  SizedBox(
                    height: 19,
                  ),

                   // login button
                   defaultbutton(
                     text: 'login',
                      function: (){
                         if(formkey.currentState.validate()){
                       print('hi');
                     }
                   }
                   ),

                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          'Do\'t have an account?'
                      ),
                      TextButton(onPressed: (){},
                          child: Text('Register now'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



