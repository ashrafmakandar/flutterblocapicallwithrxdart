import 'file:///C:/Users/SAP1/AndroidStudioProjects/texcheck/lib/tvshow/Allshows.dart';
import 'file:///C:/Users/SAP1/AndroidStudioProjects/texcheck/lib/tvshow/showprovider.dart';

class tvrepo {
  var provider = showprovider();

  Future<List<Allshows>> getshows() {
    return provider.fetchshow();
  }
}
