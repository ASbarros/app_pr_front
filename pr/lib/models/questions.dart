import 'package:pr/providers/provider.dart';

class Question {
  Question();
  String description = "ola";
  int category;

  Question.fromJson(Map<String, dynamic> json)
      : description = json['description'],
        category = json['category'];

  static Future<Question> get() async =>
      await Provider.get(router: 'question').then((value) async {
        assert(value != null);
        return Question.fromJson(value);
      });
}
