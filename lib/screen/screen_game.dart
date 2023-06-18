import 'package:flutter/material.dart';
import 'package:test_aprann/utilis/game.dart';
import 'package:test_aprann/widgets/keyboard_game.dart';
class ScreenGame extends StatefulWidget {
  const ScreenGame({Key? key}) : super(key: key);

  @override
  State<ScreenGame> createState() => _ScreenGameState();
}

class _ScreenGameState extends State<ScreenGame> {
  WordGame _game = WordGame();
  late String word;

  @override
  void initState(){
    //TODO:implement initState
    super.initState();
    _game.initGame();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor:Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Wordle',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          // structure de base de l'app;ication
          KeyboardGame(_game),
        ],
      ),
    );

  }
}