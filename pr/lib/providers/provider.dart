import 'dart:convert';

import 'package:pr/providers/environment/.env';
import 'package:http/http.dart' as http;

class Provider {
  static Future<Object> getQuestion() async {
    Environment env = Environment();

    var response = await http.get(env.serve + 'teste',
        headers: {"Content-Type": "application/json"});

    return json.decode(response.body);
  }
}
