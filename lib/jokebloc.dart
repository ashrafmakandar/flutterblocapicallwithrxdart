import 'package:rxdart/rxdart.dart';
import 'package:texcheck/Jokes.dart';
import 'package:texcheck/Jokrepo.dart';

class jokebloc {
  var repo = Jokerepo();
  final _jokstream = PublishSubject<List<Value>>();

  Observable<List<Value>> get alljokess => _jokstream.stream;

  fetchAlljokess() async {
    List<Value> itemModel = await repo.getalljokes();
    _jokstream.sink.add(itemModel);
  }

  dispose() {
    _jokstream.close();
  }
}
final blocjok =jokebloc();