import 'package:on_tab/screens/app/add_screen.dart';
import 'package:on_tab/screens/app/history_screen.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {

  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  double money = 40.23;
  String token;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: IconButton(
              icon: Icon(
                Icons.history,
                color: Colors.white,
                size: 35.0,
              ),
              onPressed: () {
                Navigator.pushNamed(context, HistoryScreen.id);
              }),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 35.0,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, AddScreen.id);
                }),
          ),
        ],
      ),
      backgroundColor: Colors.greenAccent,
      body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "\$${money.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontFamily: "SigmarOne",
                    fontSize: 64,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}