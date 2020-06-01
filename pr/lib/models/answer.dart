import 'package:flutter/material.dart';

class Answer {
  Answer();
  String description = '';
  bool right;
  int question;
  Color color = Colors.white;

  Answer.fromJson(Map<String, dynamic> json)
      : description = json['description'],
        right = json['right'] == 1 ? true : false,
        question = json['question'];

  static List<Answer> listFromJson(List<dynamic> json) {
    List<Answer> list = [];
    json.forEach((element) {
      list.add(Answer.fromJson(element));
    });
    return list;
  }
}
