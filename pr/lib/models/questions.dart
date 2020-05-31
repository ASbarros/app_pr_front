import 'package:pr/models/answer.dart';
import 'package:pr/providers/provider.dart';

class Question {
  Question();
  String description = "ola";
  int category;
  List<Answer> answers = [];

  Question.fromJson(Map<String, dynamic> json)
      : description = json['description'],
        category = json['category'],
        answers = Answer.listFromJson(json['answers']);

  static Future<Question> get() async =>
      await Provider.get(router: 'question').then((value) async {
        assert(value != null);
        return Question.fromJson(value);
      });
}
