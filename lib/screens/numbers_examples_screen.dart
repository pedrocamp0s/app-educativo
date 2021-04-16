import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../utils/example.dart';

class NumbersExampleScreen extends StatelessWidget {
  final Example example;
  final String number;

  NumbersExampleScreen({this.example, this.number});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Educativo"),
      ),
      body: Column(
        children: [
          Container(
            child: Text(
              'Aqui temos ' + this.number + ' animais:',
              style: TextStyle(fontSize: 20),
            ),
            margin: EdgeInsets.only(right: 50, left: 50, top: 20, bottom: 30),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              children: List.generate(int.parse(this.number), (index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Column(
                    children: [
                      Container(
                        child: Image.network(
                          this.example.imageUrl,
                          height: 80,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                value: null,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                );
              }),
            ),
          ),
          Container(
            child: IconButton(
              icon: Icon(Icons.volume_up),
              onPressed: () {
                FlutterTts flutterTts = FlutterTts();
                flutterTts.setLanguage("pt-Br");
                flutterTts.speak(this.example.name);
              },
            ),
          ),
        ],
      ),
    );
  }
}
