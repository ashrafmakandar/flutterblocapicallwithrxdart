import 'dart:convert';

Jokes jokesFromJson(String str) => Jokes.fromJson(json.decode(str));

String jokesToJson(Jokes data) => json.encode(data.toJson());

class Jokes {
  Jokes({
    this.type,
    this.value,
  });

  String type;
  List<Value> value;

  factory Jokes.fromJson(Map<String, dynamic> json) => Jokes(
    type: json["type"],
    value: List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "value": List<dynamic>.from(value.map((x) => x.toJson())),
  };
}

class Value {
  Value({
    this.id,
    this.joke,
    this.categories,
  });

  int id;
  String joke;
  List<dynamic> categories;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    id: json["id"],
    joke: json["joke"],
    categories: List<dynamic>.from(json["categories"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "joke": joke,
    "categories": List<dynamic>.from(categories.map((x) => x)),
  };
}
