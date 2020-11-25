import 'package:texcheck/Jokes.dart';
import 'package:texcheck/jokeprovider.dart';


class Jokerepo{
  var provider= jokeprovider();

  Future<List<Value>> getalljokes(){
    return provider.getjokes();
  }
}