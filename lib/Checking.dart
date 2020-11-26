import 'package:flutter/material.dart';
import 'file:///C:/Users/SAP1/AndroidStudioProjects/texcheck/lib/jokes/Jokeview.dart';
import 'package:texcheck/Reqres.dart';
import 'Checkbloc.dart';

class Checking extends StatefulWidget {
  @override
  _CheckingState createState() => _CheckingState();
}

class _CheckingState extends State<Checking> {
  @override
  Widget build(BuildContext context) {
    blocs.fetchAldata();
    return Scaffold(
      body: StreamBuilder<List<Datum>>(
          stream: blocs.alldata,
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
                                builder: (context) => Jokeview())));
                      },
                      child: Card(
                        child: ListTile(
                          subtitle: Text(snapshot.data[index].firstName),
                          title: Text(snapshot.data[index].email.toString()),
                          leading: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                snapshot.data[index].avatar.toString()),
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
