import 'package:texcheck/Cherckprovider.dart';
import 'package:texcheck/Reqres.dart';

class Checkrepo {

  var provider = Checkprovider();

  Future<List<Datum>> getdat() {
    return provider.fetchPost();
  }


}