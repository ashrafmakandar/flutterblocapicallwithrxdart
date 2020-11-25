import 'package:rxdart/rxdart.dart';
import 'package:texcheck/Checkrepo.dart';
import 'package:texcheck/Reqres.dart';

class Checkbloc {
  var _repo = Checkrepo();
  final refetcher = PublishSubject<List<Datum>>();

  Observable<List<Datum>> get alldata => refetcher.stream;

  fetchAldata() async {
    List<Datum> itemModel = await _repo.getdat();
    refetcher.sink.add(itemModel);
  }

  dispose() {
    refetcher.close();
  }
}

final blocs = Checkbloc();
