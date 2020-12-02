
import 'package:flutter/material.dart';
import 'package:texcheck/Newest.dart';
import 'package:texcheck/Newpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String texts;

  MyHomePage({this.texts});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final edit = TextEditingController();
  bool _ispress = false;
  bool _isvisble = true;
  int count = 0;
  List<String> aa = [
    'please select a value',
    'one',
    'two',
    'three',
    'four',
    'five'
  ];
  String dropdoenvalue;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: edit,
            ),
            FlatButton(
                onPressed: () {
                  edit.text = "welcome from button 1";

                  Navigator.push(
                      context,
                      (MaterialPageRoute(
                          builder: (context) => Newpage(
                                text: edit.text,
                              ))));
                },
                child: Text("move data")),
            _ispress
                ? CircularProgressIndicator()
                : FlatButton(
                    onPressed: () {
                      setState(() {
                        _ispress = true;
                      });

                      edit.text = "welcome from button 2";
                      Future.delayed(Duration(seconds: 4), () {
                        Navigator.push(
                            context,
                            (MaterialPageRoute(
                                builder: (context) => Newpage(
                                      text: edit.text,
                                    ))));
                      });
                    },
                    child: Text("move data from second option")),
            DropdownButton(
              items: aa
                  .map((e) => new DropdownMenuItem(
                      value: e.toString(),
                      child: Text(
                        e,
                        style: TextStyle(color: Colors.deepPurpleAccent),
                      )))
                  .toList(),
              hint: Text("Please choose a location"),
              dropdownColor: Colors.white,
              onChanged: (newval) {
                print(newval);
                setState(() {
                  dropdoenvalue = newval;
                  edit.text = dropdoenvalue;
                });
                Navigator.push(context,
                    (MaterialPageRoute(builder: (context) => Newest())));
              },
            ),
            _isvisble
                ? Visibility(
                    visible: _isvisble,
                    child: _isvisble
                        ? Text(
                            "visible",
                            style: TextStyle(fontSize: 25, color: Colors.black),
                          )
                        : Text(
                            "invisible",
                            style: TextStyle(fontSize: 25, color: Colors.black),
                          ))
                : CircularProgressIndicator(),
            FlatButton(
                color: Colors.black,
                textColor: Colors.redAccent,
                splashColor: Colors.white,
                onPressed: () {
                  count++;
                  setState(() {
                    if (count % 2 == 0) {
                      print(count);
                      _isvisble = false;
                    } else {
                      print(count);
                      _isvisble = true;
                    }
                  });
                },
                child: Text("click"))
            
            ,

          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
