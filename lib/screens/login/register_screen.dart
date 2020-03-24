import 'package:flutter/material.dart';
import 'package:on_tab/components/rounded_buttons.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:on_tab/screens/app/add_screen.dart';
import 'package:on_tab/screens/login/welcome_screen.dart';
import 'package:on_tab/styles/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showSpinner = false;
  String email;
  String password;

  String token;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: "Register",
                colour: Colors.blueAccent,
                onPressed: () async {
                  //HTTP REQUEST


                  var url = 'http://localhost:8000/api/user/register';

                  var response = await http.post(url,
                      body: json.encode({"email": email, "password": password}),
                      headers: {"Content-Type": "application/json"});

                  var status = response.statusCode;

                  if (status == 200) {
                    Navigator.pushNamed(context, WelcomeScreen.id);
                  } else {
                    print("SHOW POPUP");
                    //TODO: ADD POPUP
                  }

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}