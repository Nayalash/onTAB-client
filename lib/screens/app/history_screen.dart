import 'package:flutter/material.dart';
import 'package:on_tab/components/custom_card_list.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:on_tab/utils/post_controller.dart';

class HistoryScreen extends StatefulWidget {
  static const String id = 'history_screen';

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {


  Future<List<PostController>> getPosts() async {
    var url = "http://localhost:8000/api/posts/get/";

    var response = await http.get(url, headers: {
      "auth-token":
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1ZTc3Yzc1ZjYxMGU1ODI3MDBhYTgzOWMiLCJpYXQiOjE1ODQ5ODM4MzN9.4s2AhDUIshWRzShRMOmF-1Jns9FWPsIJv9MQV7qg65I",
    });

    var jsonData = jsonDecode(response.body);

    List<PostController> posts = [];

    for (var p in jsonData) {
      PostController post = PostController(id: p["_id"], title: p["title"], price: p["price"], v: p["__v"]);
      posts.add(post);
      print(post.id);
      print("LENGTH : " + posts.length.toString());
    }

    print("LENGTH : " + posts.length.toString());
    return posts;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        backgroundColor: Colors.white70,
      ),
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: FutureBuilder(
          future: getPosts(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: Text("NO POSTS..."),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomCardList(
                      title: snapshot.data[index].title,
                      price: snapshot.data[index].price,
                      id: snapshot.data[index].price,
                    );
                  },
                );
              }
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
