import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../utils/example.dart';

class AlphabetExamplesScreen extends StatelessWidget {
  final List<Example> examples;
  final String letter;

  AlphabetExamplesScreen({this.examples, this.letter});

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
              'São exemplos de coisas que começam com a letra ' +
                  this.letter +
                  ':',
              style: TextStyle(fontSize: 20),
            ),
            margin: EdgeInsets.only(right: 50, left: 50, top: 20),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(this.examples.length, (index) {
                Example example = this.examples[index];

                return Card(
                  elevation: 5,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                  child: Column(
                    children: [
                      Container(
                        child: Image.network(
                          example.imageUrl,
                          width: 100,
                          height: 100,
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
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.volume_up),
                          onPressed: () {
                            FlutterTts flutterTts = FlutterTts();
                            flutterTts.setLanguage("pt-Br");
                            flutterTts.speak(example.name);
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
        ],
      ),
    );
  }
}
