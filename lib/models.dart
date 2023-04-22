class Theme {
  final int id;
  final String name;

  Theme({required this.id, required this.name});
}

class Level {
  final int id;
  final String name;

  Level({required this.id, required this.name});
}

class Question {
  final int id;
  final String question;
  final String response;

  Question({required this.id, required this.question, required this.response});
}
