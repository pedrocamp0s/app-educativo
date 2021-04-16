import 'package:flutter/material.dart';
import 'package:whiteboardkit/whiteboardkit.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../utils/number.dart';
import '../screens/numbers_examples_screen.dart';
import '../screens/options_screen.dart';

class Numbers extends StatefulWidget {
  final List<Number> numbers;

  Numbers({this.numbers});

  @override
  _NumbersState createState() => _NumbersState();
}

class _NumbersState extends State<Numbers> {
  DrawingController controller;
  int numberIndex;

  @override
  void initState() {
    controller = new DrawingController();
    controller.initializeSize(300, 300);
    numberIndex = 0;
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
                    if (this.numberIndex == 0) {
                      setState(() {
                        this.numberIndex = widget.numbers.length - 1;
                      });
                    } else {
                      setState(() {
                        this.numberIndex--;
                      });
                    }
                    this.controller.wipe();
                  },
                  iconSize: 50,
                ),
              ),
              Container(
                child: Text(
                  'Número ' + widget.numbers[this.numberIndex].name,
                  style: TextStyle(fontSize: 30),
                ),
                margin: EdgeInsets.only(top: 20, left: 40, right: 40),
              ),
              Container(
                child: IconButton(
                  icon: Icon(Icons.arrow_right),
                  onPressed: () {
                    if (this.numberIndex == widget.numbers.length - 1) {
                      setState(() {
                        this.numberIndex = 0;
                      });
                    } else {
                      setState(() {
                        this.numberIndex++;
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
                        builder: (context) => NumbersExampleScreen(
                            example: widget.numbers[this.numberIndex].example,
                            number: widget.numbers[this.numberIndex].name),
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
                    flutterTts.speak(widget.numbers[this.numberIndex].name);
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
        Text('Use a área abaixo para desenhar o número ' +
            widget.numbers[this.numberIndex].name),
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
