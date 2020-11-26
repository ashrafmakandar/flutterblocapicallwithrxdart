import 'package:texcheck/jokes/Jokes.dart';
import 'package:texcheck/jokes/jokeprovider.dart';

class Jokerepo {
  var provider = jokeprovider();

  Future<List<Value>> getalljokes() {
    return provider.getjokes();
  }
}
