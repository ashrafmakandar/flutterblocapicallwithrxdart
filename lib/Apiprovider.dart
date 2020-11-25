import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:texcheck/Posts.dart';

class Apiprovider {
  var url = "https://jsonplaceholder.typicode.com/photos";

  Future<List<Posts>> fetchPost() async {
    http.Response response = await http.get(url);
    List po = json.decode(response.body);

    return po.map((e) => Posts.fromJson(e)).toList();
  }
}
