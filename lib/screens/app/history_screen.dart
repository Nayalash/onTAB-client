import 'package:flutter/material.dart';
import 'package:on_tab/components/custom_card_list.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:on_tab/utils/post_controller.dart';
import 'package:on_tab/utils/token.dart' as getToken;

class HistoryScreen extends StatefulWidget {
  static const String id = 'history_screen';

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<PostController> _post = List<PostController>();

  Future<List<PostController>> getPosts() async {
    var url = "http://localhost:8000/tasks";

    var response = await http
        .get(url, headers: {"Authorization": "Bearer ${getToken.token}"});

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
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
          title: Text(
            'Expense History',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemBuilder: (context, index) {
            return FlatButton(
              child: CustomCardList(
                title: _post[index].title,
                price: (_post[index].price).toDouble(),
                id: _post[index].id,
              ),
              onPressed: () async {
                var url = "http://localhost:8000/${_post[index].id}";

                var response = await http.delete(url,
                    headers: {"Authorization": "Bearer ${getToken.token}"});
              },
            );
          },
          itemCount: _post.length,
        ));
  }
}
