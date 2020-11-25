import 'dart:async';
import 'dart:core';

import 'package:rxdart/rxdart.dart';
import 'package:texcheck/Apirepo.dart';
import 'package:texcheck/Posts.dart';

class Flutbloc {
  final _repository = Apirepo();
  final _moviesFetcher = PublishSubject<List<Posts>>();

  Observable<List<Posts>> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    List<Posts> itemModel = await _repository.fetchlist();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}
final bloc = Flutbloc();