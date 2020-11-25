import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:texcheck/Jokes.dart';

class jokeprovider {
  var url = "http://api.icndb.com/jokes/random/200";

  Future<List<Value>> getjokes() async {
    http.Response response = await http.get(url);
    Map d = json.decode(response.body);
    return Jokes.fromJson(d).value;
  }
}
