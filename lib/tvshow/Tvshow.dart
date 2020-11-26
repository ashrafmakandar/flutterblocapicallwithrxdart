import 'package:flutter/material.dart';
import 'package:meet_network_image/meet_network_image.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'file:///C:/Users/SAP1/AndroidStudioProjects/texcheck/lib/tvshow/Allshows.dart';
import 'file:///C:/Users/SAP1/AndroidStudioProjects/texcheck/lib/tvshow/tvblocks.dart';
import 'package:progressive_image/progressive_image.dart';

class Tvshow extends StatefulWidget {
  @override
  _TvshowState createState() => _TvshowState();
}

class _TvshowState extends State<Tvshow> {
  @override
  Widget build(BuildContext context) {
    tvsbloc.fetchAlljokess();
    return Scaffold(
      body: StreamBuilder<List<Allshows>>(
          stream: tvsbloc.allSHOWSs,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          MeetNetworkImage(
                            imageUrl: snapshot.data[index].image.original,
                            fit: BoxFit.cover,
                            loadingBuilder: (context) => Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorBuilder: (context, e) => Center(
                              child: Text('Error appear!'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              snapshot.data[index].name,
                              style: TextStyle(fontSize: 25),
                            ),
                          )
                        ],
                      ),
                    );
                  });
            } else {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Text(
                    'Loading',
                    style: TextStyle(fontSize: 40),
                  ),
                  JumpingDotsProgressIndicator(
                    fontSize: 50.0,
                    numberOfDots: 3,
                  ),
                ],
              ));
            }
          }),
    );
  }
}
