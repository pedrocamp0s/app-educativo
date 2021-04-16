import 'package:flutter/material.dart';
import 'package:whiteboardkit/whiteboardkit.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../utils/letter.dart';
import '../screens/alphabet_examples_screen.dart';
import '../screens/options_screen.dart';

class Alphabet extends StatefulWidget {
  final List<Letter> letters;

  Alphabet({this.letters});

  @override
  _AlphabetState createState() => _AlphabetState();
}

class _AlphabetState extends State<Alphabet> {
  DrawingController controller;
  int letterIndex;

  @override
  void initState() {
    controller = new DrawingController();
    controller.initializeSize(300, 300);
    letterIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _handleReturnHomeScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OptionsScreen(),
        ),
      );
    }

    return Column(
      children: [
        Container(
          child: Row(
            children: [
              Container(
                child: IconButton(
                  icon: Icon(Icons.arrow_left),
                  onPressed: () {
                    if (this.letterIndex == 0) {
                      setState(() {
                        this.letterIndex = widget.letters.length - 1;
                      });
                    } else {
                      setState(() {
                        this.letterIndex--;
                      });
                    }
                    this.controller.wipe();
                  },
                  iconSize: 50,
                ),
              ),
              Container(
                child: Text(
                  'Letra ' + widget.letters[this.letterIndex].name,
                  style: TextStyle(fontSize: 30),
                ),
                margin: EdgeInsets.only(top: 20, left: 80, right: 80),
              ),
              Container(
                child: IconButton(
                  icon: Icon(Icons.arrow_right),
                  onPressed: () {
                    if (this.letterIndex == widget.letters.length - 1) {
                      setState(() {
                        this.letterIndex = 0;
                      });
                    } else {
                      setState(() {
                        this.letterIndex++;
                      });
                    }
                    this.controller.wipe();
                  },
                  iconSize: 50,
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
        Container(
          child: Row(
            children: [
              Container(
                child: IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AlphabetExamplesScreen(
                            examples: widget.letters[this.letterIndex].examples,
                            letter: widget.letters[this.letterIndex].name),
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
                    flutterTts.speak(widget.letters[this.letterIndex].name);
                  },
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
        Divider(
          height: 10,
          thickness: 3,
        ),
        Text('Use a área abaixo para desenhar a letra ' +
            widget.letters[this.letterIndex].name),
        Container(
          child: Whiteboard(
            controller: controller,
          ),
        ),
        Container(
          child: ElevatedButton(
            child: Text('Página inicial'),
            onPressed: _handleReturnHomeScreen,
          ),
        ),
      ],
    );
  }
}
