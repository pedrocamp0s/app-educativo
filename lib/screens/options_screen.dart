import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import '../utils/letter.dart';
import '../screens/alphabet_screen.dart';
import '../utils/number.dart';
import '../screens/number_screen.dart';

class OptionsScreen extends StatelessWidget {
  buildShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(
              value: null,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    void _handleAlphabetButton() async {
      var url = Uri.https(
          "app-educativo-672cd-default-rtdb.firebaseio.com", "/alphabet.json");
      buildShowDialog(context);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Navigator.of(context).pop();
        var jsonResponse = jsonDecode(response.body);
        var letterList = jsonResponse.map((e) => Letter(e)).toList();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlphabetScreen(
              letters: letterList.cast<Letter>(),
            ),
          ),
        );
      }
    }

    void _handleNumbersButton() async {
      var url = Uri.https(
          "app-educativo-672cd-default-rtdb.firebaseio.com", "/numbers.json");
      buildShowDialog(context);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Navigator.of(context).pop();
        var jsonResponse = jsonDecode(response.body);
        var numbersList = jsonResponse.map((e) => Number(e)).toList();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NumberScreen(
              numbers: numbersList.cast<Number>(),
            ),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("App Educativo"),
      ),
      body: Column(
        children: [
          Container(
            child: Text(
              'O que deseja aprender?',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            margin: EdgeInsets.only(top: 100, left: 0, right: 0, bottom: 100),
          ),
          Container(
            child: ElevatedButton(
              onPressed: _handleAlphabetButton,
              child: Image.asset(
                'assets/images/alphabet.jpg',
                width: 100,
                height: 100,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
            ),
            margin: EdgeInsets.only(top: 0, left: 125, right: 125, bottom: 20),
          ),
          Container(
            child: ElevatedButton(
              onPressed: _handleNumbersButton,
              child: Image.asset(
                'assets/images/numbers.png',
                width: 100,
                height: 100,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
            ),
            margin: EdgeInsets.only(top: 0, left: 125, right: 125, bottom: 20),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.start,
      ),
    );
  }
}
