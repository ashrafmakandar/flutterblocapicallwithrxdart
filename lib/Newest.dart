import 'package:flutter/material.dart';

import 'package:texcheck/Checking.dart';
import 'package:texcheck/Flutbloc.dart';
import 'package:texcheck/Posts.dart';

class Newest extends StatefulWidget {
  @override
  _NewestState createState() => _NewestState();
}

class _NewestState extends State<Newest> {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllMovies();
    print("widget loaded");
    return Scaffold(
      body: StreamBuilder<List<Posts>>(
          stream: bloc.allMovies,
          builder: (context, snapshot) {
            if (snapshot.hasData) {

              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            (MaterialPageRoute(
                                builder: (context) => Checking())));
                      },
                      child: ListTile(
                        title: Text(snapshot.data[index].title.toString()),
                        subtitle: Text(snapshot.data[index].id.toString()),
                        leading: CircleAvatar(
                          child: Image.network(
                            snapshot.data[index].thumbnailUrl.toString(),
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
