import 'dart:convert';

class Post {
  int id;
  String title;
  String body;

  Post(this.id, this.title, this.body);

  factory Post.fromJson(String body) {
    var parsedJson = jsonDecode(body);
    return Post(parsedJson["id"], parsedJson["title"], parsedJson["body"]);
  }

  factory Post.fromJsonList(dynamic json) {
    return Post(json["id"], json["title"], json["body"]);
  }
}

class Post2 {
  // int response_code;
  List<Map<String, dynamic>> results;

  Post2(this.results);

  factory Post2.fromJsonList(dynamic json) {
    return Post2(json["results"]);
  }
}

class Post3 {
  String category;
  String type;
  String difficulty;
  String question;
  String correct_answer;
  String incorrect_answers;

  Post3(this.category,this.type,this.difficulty,this.question,
        this.correct_answer,this.incorrect_answers);

  factory Post3.fromJsonList(dynamic json) {
    return Post3(json["category"],json["type"],json["difficulty"],
                  json["question"],json["correct_answer"],
                  json["incorrect_answers"].toString());
  }
}
