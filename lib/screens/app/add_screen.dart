import 'package:flutter/material.dart';
import 'package:on_tab/screens/app/home_screen.dart';
import 'package:on_tab/styles/constants.dart';
import 'package:on_tab/components/rounded_buttons.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';


class AddScreen extends StatefulWidget {

  static const String id = 'add_screen';


  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  String expense;
  double price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text("Add Expense"),
        backgroundColor: Colors.white70,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 50, right: 50, bottom: 10),
          child: Container(
            child: ListView(
              children: <Widget>[

                TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),

                  decoration: kTextFieldInputDecorationOne,

                  onChanged: (value) {
                    expense = value;
                  },
                ),

                SizedBox(
                  height: 50,
                ),

                TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),

                  decoration: kTextFieldInputDecorationTwo,

                  onChanged: (value) {
                    price = double.parse(value);
                  },
                ),

                SizedBox(
                  height: 100,
                ),

                RoundedButton(
                  title: "Submit",
                  colour: Colors.lightBlueAccent,
                  onPressed: () async {
                    //HTTP REQUEST

                    var url = 'http://localhost:8000/api/posts/add';
                    var response = await http.post(url, body: json.encode({"title": expense, "price": price}),
                        headers: {
                      "Content-Type": "application/json",
                          "auth-token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1ZTc3Yzc1ZjYxMGU1ODI3MDBhYTgzOWMiLCJpYXQiOjE1ODQ5ODM4MzN9.4s2AhDUIshWRzShRMOmF-1Jns9FWPsIJv9MQV7qg65I",
                    });

                    var status = response.statusCode;

                    if (status == 200) {
                      Navigator.pushNamed(context, HomeScreen.id);
                    }


                  },
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }

}