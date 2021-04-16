import './example.dart';

class Letter {
  String name;
  List<Example> examples;

  Letter(Map<String, dynamic> data) {
    this.name = data['name'];
    var examplesList = data['examples'] as List;
    this.examples = examplesList.map((e) => Example(e)).toList();
  }
}
