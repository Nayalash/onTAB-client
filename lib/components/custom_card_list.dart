import 'package:flutter/material.dart';

class CustomCardList extends StatelessWidget {
  String title;
  String id;
  double price;

  CustomCardList({this.title, this.price, this.id});
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white70,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: ListTile(
          leading: Icon(
            Icons.monetization_on,
            color: Colors.black,
          ),
          title: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          subtitle: Text(
              "\$${price.toStringAsFixed(2)} \n" +
              "${id}",
            style: TextStyle(
              color: Colors.black
            ),
          ),
        )
    );
  }
}

