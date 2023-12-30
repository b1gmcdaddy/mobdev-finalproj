import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:midterm_b/models/Post.dart';
import 'package:midterm_b/screen/PostDetail.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = "dashboard";
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int number = 1;
  List<Post> posts = [];
  List<Post3> posts2 = [];
  @override
  void initState() {
    super.initState();

    getPostsLists();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PostDetail(id1: posts2[index])));
          },
          child: Container(
            margin: EdgeInsets.all(30),
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent, width: 1)),
            child: Column(
              children: [
                Text(posts2[index].category),
                Text(posts2[index].type),
                Text(posts2[index].difficulty),
                Text(posts2[index].question),
                // Text(posts2[index].correct_answer),
                // Text('Incorrect answers: ${posts2[index].incorrect_answers}'),
                // Text('${posts2[index]}')
              ],
            ),
          ),
        );
      },
      itemCount: posts2.length,
    );
  }

  Future<void> getPostsLists() async {
    Response response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    Response response2 = await http.get(Uri.parse(
        "https://opentdb.com/api.php?amount=7&category=18&difficulty=easy&type=multiple"));

    List<dynamic> jsonList = jsonDecode(response.body);
    Map<String, dynamic> jsonMap = jsonDecode(response2.body);
    List<dynamic> parsedPostsb = jsonMap['results'];

    List<Post> parsedPosts = jsonList.map((e) => Post.fromJsonList(e)).toList();
    List<Post3> parsedPosts2 =
        parsedPostsb.map((e) => Post3.fromJsonList(e)).toList();
    setState(() {
      posts = parsedPosts;
      posts2 = parsedPosts2;
    });
  }
}
