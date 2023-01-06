class Todo {
  Todo({required this.title, required this.creationDate});
  Todo.fromJson(Map<String, dynamic> json) 
    : title = json['title'],
      creationDate = DateTime.parse(json['dateTime']);

  String title;
  DateTime creationDate;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'dateTime': creationDate.toIso8601String(),
    };
  }


}