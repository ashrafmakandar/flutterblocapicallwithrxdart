import 'package:flutter/material.dart';
import 'package:texcheck/Jokes.dart';
import 'package:texcheck/Tvshow.dart';
import 'jokebloc.dart';

class Jokeview extends StatefulWidget {
  @override
  _JokeviewState createState() => _JokeviewState();
}

class _JokeviewState extends State<Jokeview> {
  @override
  Widget build(BuildContext context) {
    blocjok.fetchAlljokess();
    return Scaffold(
      body: StreamBuilder<List<Value>>(
          stream: blocjok.alljokess,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _getlist(snapshot.data);
            } else if (snapshot.hasError) {
              return _error(snapshot.error);
            } else {
              return _loadingwidget();
            }
          }),
    );
  }

  Widget _getlist(List<Value> data) {
    return _listviews(data);
  }

  Widget _error(Object error) {
    return Center(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 30.0,
          ),
          Text(
            "Loading Data....." + error.toString(),
            style: TextStyle(color: Colors.black, fontSize: 30.0),
          )
        ],
      ),
    ));
  }

  Widget _listviews(List<Value> data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _card(data[index]);
        });
  }

  Widget _card(Value data) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) => Dialog(
                  child: Container(
                      height: 150,
                      width: 200,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      (MaterialPageRoute(
                                          builder: (context) => Tvshow())));
                                },
                                child: Text(
                                  data.joke,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.greenAccent),
                                ),
                              ),
                            ),
                          ))),
                ));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                data.joke,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20.0,
                    color: Colors.blue[300]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _loadingwidget() {
    return Center(
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
      ),
    );
  }
}
