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

  List<PostController> _post = List<PostController>();

  Future<List<PostController>> getPosts() async {
    var url = "http://localhost:8000/api/posts/get/";

    var response = await http.get(url, headers: {
      "auth-token":
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1ZTc3Yzc1ZjYxMGU1ODI3MDBhYTgzOWMiLCJpYXQiOjE1ODQ5ODM4MzN9.4s2AhDUIshWRzShRMOmF-1Jns9FWPsIJv9MQV7qg65I",
    });

    var posts = List<PostController>();

    var postsJson = json.decode(response.body);

    for (var postJson in postsJson) {
      posts.add(PostController.fromJson(postJson));

    }
    return posts;
  }

  @override
  void initState() {

    getPosts().then((value) {
      setState(() {
        _post.addAll(value);
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Expense History'),
        ),
        backgroundColor: Colors.white70,
        body: ListView.builder(
          itemBuilder: (context, index) {
            return CustomCardList(
              title: _post[index].title,
              price: _post[index].price,
              id: _post[index].id,
            );
          },
          itemCount: _post.length,
        )
    );
  }
}
