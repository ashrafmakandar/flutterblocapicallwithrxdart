import 'package:texcheck/tvcrew/Crew.dart';
import 'package:texcheck/tvcrew/crewprovider.dart';

class crewrepo {
  var provider = crewprovider();

  Future<List<Crew>> getcrew(int id) {
    return provider.fetchshow(id);
  }
}
