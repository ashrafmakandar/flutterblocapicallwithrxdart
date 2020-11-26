import 'package:rxdart/rxdart.dart';
import 'file:///C:/Users/SAP1/AndroidStudioProjects/texcheck/lib/tvshow/Allshows.dart';
import 'package:texcheck/tvshow/tvrepo.dart';

class tvblocks {
  var repo = tvrepo();
  final _jokstream = PublishSubject<List<Allshows>>();

  Observable<List<Allshows>> get allSHOWSs => _jokstream.stream;

  fetchAlljokess() async {
    List<Allshows> itemModel = await repo.getshows();
    _jokstream.sink.add(itemModel);
  }

  dispose() {
    _jokstream.close();
  }
}

final tvsbloc = tvblocks();
