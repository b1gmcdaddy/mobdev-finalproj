import 'package:flutter/material.dart';
import 'package:midterm_b/models/Post.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PostDetail extends StatelessWidget {
  final Post3 id1;
  PostDetail({required this.id1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail"),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.all(30),
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent, width: 1)),
            child: Column(
              children: [
                Text(id1.category),
                Text(id1.type),
                Text(id1.difficulty),
                Text(id1.question),
                Text(id1.correct_answer),
                Text('Incorrect answers: ${id1.incorrect_answers}'),
              ],
            ),
        )));

    
  }
}
