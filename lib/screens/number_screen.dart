import 'package:flutter/material.dart';

import '../widgets/numbers.dart';
import '../utils/number.dart';

class NumberScreen extends StatelessWidget {
  final List<Number> numbers;
  NumberScreen({this.numbers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Educativo"),
      ),
      body: Numbers(numbers: this.numbers),
    );
  }
}
