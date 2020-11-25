import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:texcheck/Reqres.dart';

class Checkprovider {
  var url = "https://reqres.in/api/users?page=2";

  Future<List<Datum>> fetchPost() async {
    http.Response response = await http.get(url);
    Map po = json.decode(response.body);


    return Reqres.fromJson(po).data;
  }
}
