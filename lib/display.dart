import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:audioplayers/audioplayers.dart';

class DisplayArguments {
  final String name;
  final int age;

  DisplayArguments({required this.name, required this.age});
}

class Display extends StatefulWidget {
  final String name;
  final int age;

  Display({required this.name, required this.age});

  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void _navigateBack() {
    _confettiController.stop();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();

    final String name = widget.name;
    final int age = widget.age;
    player.play(AssetSource('sounds/burst.mp3'));

    return Scaffold(
      appBar: AppBar(
        title: Text("Age Calculator"),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20),
                    Hero(
                      tag: 'pattern',
                      child: Image.asset(
                        "assets/images/pattern.gif",
                        height: 300,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Hello, $name!",
                      style: TextStyle(
                        fontFamily: 'Merriweather',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Your age is $age years.",
                      style: TextStyle(
                        fontFamily: 'Merriweather',
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: ElevatedButton(
                        onPressed: _navigateBack,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          textStyle: TextStyle(
                            color: Colors.white,
                          ),
                          elevation: 4,
                        ),
                        child: Text('Go Back'),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              emissionFrequency: 0.05,
              numberOfParticles: 20,
              gravity: 0.1,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
