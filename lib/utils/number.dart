import './example.dart';

class Number {
  String name;
  Example example;

  Number(Map<String, dynamic> data) {
    this.name = data['name'];
    this.example = Example(data['examples'][0]);
  }
}
