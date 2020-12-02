import 'package:rxdart/rxdart.dart';
import 'package:texcheck/tvcrew/Crew.dart';
import 'package:texcheck/tvcrew/crewrepo.dart';

class crewbloc {
  var repo = crewrepo();
  final _jokstream = PublishSubject<List<Crew>>();

  Observable<List<Crew>> get allcrew => _jokstream.stream;

  fetchAllcrew(int id) async {
    List<Crew> itemModel = await repo.getcrew(id);
    _jokstream.sink.add(itemModel);
  }

  dispose() {
    _jokstream.close();
  }
}

final crewsbloc =crewbloc();