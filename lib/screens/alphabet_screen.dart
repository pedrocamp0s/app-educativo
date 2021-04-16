import 'package:flutter/material.dart';

import '../widgets/alphabet.dart';
import '../utils/letter.dart';

class AlphabetScreen extends StatelessWidget {
  final List<Letter> letters;
  AlphabetScreen({this.letters});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Educativo"),
      ),
      body: Alphabet(letters: this.letters),
    );
  }
}
