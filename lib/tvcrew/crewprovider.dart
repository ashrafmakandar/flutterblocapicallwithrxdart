import 'dart:convert';

import 'package:http/http.dart' as http;
import 'file:///C:/Users/SAP1/AndroidStudioProjects/texcheck/lib/tvshow/Allshows.dart';
import 'package:texcheck/tvcrew/Crew.dart';

class crewprovider {
  Future<List<Crew>> fetchshow(int id) async {
    int ids= id+1;
    var url = "http://api.tvmaze.com/shows/$ids/cast";
    http.Response response = await http.get(url);
    List rr = json.decode(response.body);
    print(response.body);

    return rr.map((e) => Crew.fromJson(e)).toList();
  }
}
