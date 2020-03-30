import 'package:flutter/material.dart';
import 'package:on_tab/screens/app/home_screen.dart';
import 'package:on_tab/styles/constants.dart';
import 'package:on_tab/components/rounded_buttons.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:on_tab/utils/token.dart' as getToken;


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
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
            "Add Expense",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
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
                  colour: Colors.black,
                  onPressed: () async {
                    //HTTP REQUEST

                    var url = 'http://localhost:8000/api/posts/add';
                    var response = await http.post(url, body: json.encode({"title": expense, "price": price}),
                        headers: {
                      "Content-Type": "application/json",
                          "auth-token": getToken.token,
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