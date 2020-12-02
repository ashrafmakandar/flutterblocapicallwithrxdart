import 'package:flutter/material.dart';
import 'package:meet_network_image/meet_network_image.dart';
import 'package:texcheck/tvcrew/Crew.dart';
import 'package:texcheck/tvcrew/crewbloc.dart';

void main() => runApp(new MaterialApp(
      home: Crews(),
    ));

class Crews extends StatefulWidget {
  int index;

  Crews({this.index});

  @override
  _CrewsState createState() => _CrewsState();
}

class _CrewsState extends State<Crews> {
  @override
  Widget build(BuildContext context) {
    crewsbloc.fetchAllcrew(this.widget.index);
    return Scaffold(
        body: StreamBuilder<List<Crew>>(
            stream: crewsbloc.allcrew,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(snapshot.data[index].person.name),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MeetNetworkImage(
                                imageUrl:
                                    snapshot.data[index].person.image.original,
                                fit: BoxFit.cover,
                                loadingBuilder: (context) => Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorBuilder: (context, e) => Center(
                                  child: Text('Error appear!'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
