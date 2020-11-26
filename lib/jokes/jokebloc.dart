import 'package:rxdart/rxdart.dart';
import 'file:///C:/Users/SAP1/AndroidStudioProjects/texcheck/lib/jokes/Jokrepo.dart';
import 'package:texcheck/jokes/Jokes.dart';

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