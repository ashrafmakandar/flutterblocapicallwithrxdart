

import 'package:flutter/material.dart';
import 'package:texcheck/main.dart';

void main() => runApp(Newpage());

class Newpage extends StatefulWidget {
  String text;

  Newpage({this.text});

  @override
  _NewpageState createState() => _NewpageState();
}

class _NewpageState extends State<Newpage> {
  final textcon = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    textcon.text = this.widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(

              decoration: InputDecoration(
                labelText: "user",
                hintText: "enter username",
                border: OutlineInputBorder(),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Icon(Icons.assignment_ind_sharp),
                ),
              ),
              controller: textcon,
            ),

          ),
          FlatButton(
              padding: EdgeInsets.all(10),
              color: Colors.blue,
              textColor: Colors.white,

              onPressed: () {
                Navigator.push(
                    context,
                    (MaterialPageRoute(
                        builder: (context) => MyHomePage(
                              texts: textcon.text.toString(),
                            ))));
              },
              child: Text("move data to parent secreen")),

        ],
      ),
    );
  }
}
