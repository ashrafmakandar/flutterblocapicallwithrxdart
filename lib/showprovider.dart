import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:texcheck/Allshows.dart';

class showprovider {
  var url = "http://api.tvmaze.com/shows";

  Future<List<Allshows>> fetchshow() async {
    http.Response response = await http.get(url);
    List rr = json.decode(response.body);
    print(response.body);

    return rr.map((e) => Allshows.fromJson(e)).toList();
  }
}
