import 'package:texcheck/Allshows.dart';
import 'package:texcheck/showprovider.dart';

class tvrepo {
  var provider = showprovider();

  Future<List<Allshows>> getshows() {
    return provider.fetchshow();
  }
}
