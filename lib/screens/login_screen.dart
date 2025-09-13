

import 'package:flutter/material.dart';
import 'package:flutter_application_1/animations/fade_animation.dart';
import 'package:flutter_application_1/utils/global.colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [GlobalColors.mainColor, GlobalColors.secondaryColor],
            begin: Alignment.center,
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  FadeAnimation(1,
                  Text(
                    "Login",
                    style: TextStyle(color: GlobalColors.textColor, fontSize: 40),
                  ),
                  ),
                  SizedBox(height: 10),
                  FadeAnimation(1.3,
                  Text(
                    "Sign in to continue",
                    style: TextStyle(color: GlobalColors.SubTextColor, fontSize: 18),
                  ),)
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: GlobalColors.backgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60)
                  )
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 60),
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(255, 95, 27, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10)
                            )
                          ]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Email or Phone number",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none
                                ),
                                obscureText: true,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      Text(
                        "Forgot Password?",
                        style: TextStyle(color: GlobalColors.textGrey),
                      ),
                      SizedBox(height: 40),
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: GlobalColors.mainColor
                        ),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(color: GlobalColors.textColor, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Create New Account",
                        style: TextStyle(color: GlobalColors.textDark),
                      )
                    ],
                  ),
                ),
              ),
            ),  
          ],
        ),
      ),
    );
  }
}