import 'dart:convert';

class Todos {
  bool completed;
  final String text;

  Todos({required this.completed, required this.text});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'completed': completed,
      'text': text,
    };
  }

  factory Todos.fromMap(Map<String, dynamic> map) {
    return Todos(
      completed: map['completed'] as bool,
      text: map['text'] as String,
    );
  }
  static List<Todos> fromJsonList(List<dynamic> list) {
    return list.map((item) {
      return Todos.fromMap(item);
    }).toList();
  }

  String toJson() => json.encode(toMap());

  factory Todos.fromJson(String source) =>
      Todos.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<Map<String, dynamic>> toMapList(List<Todos> list) {
    return list.map((item) => item.toMap()).toList();
  }

  static String toJsonList(List<Todos> list) {
    return jsonEncode(Todos.toMapList(list));
  }
}
