class Answer {
  Answer();
  String description;
  bool right;
  int question;

  Answer.fromJson(Map<String, dynamic> json)
      : description = json['description'],
        right = json['right'] == 1 ? true : false,
        question = json['question'];

  static List<Answer> listFromJson(List<dynamic> json) {
    Answer answer = Answer();
    answer.description = 'teste';
    List<Answer> list = [answer, answer, answer, answer];
    return list;
  }
}
