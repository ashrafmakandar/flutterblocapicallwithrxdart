import 'package:texcheck/Apiprovider.dart';
import 'package:texcheck/Posts.dart';

class Apirepo {
  final provider = Apiprovider();

  Future<List<Posts>> fetchlist() {
    return provider.fetchPost();
  }
}
