import 'package:flutter/material.dart';

import '../utilis/game.dart';
class BoardGame extends StatefulWidget {
  BoardGame(this.game,{Key? key}) : super(key: key);
  WordGame game;
  @override
  State<BoardGame> createState() => _BoardGameState();
}

class _BoardGameState extends State<BoardGame> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: widget.game.wordBoard.map((row) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: row.map((e) => Container(
              padding: EdgeInsets.all(16.0),
              width: 50,
              height: 50,
              margin: EdgeInsets.symmetric(vertical:8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: e.code==0 ?Colors.black:
                e.code == 1 ?Colors.green.shade400:
                e.code == 2
                    ? Colors.amber
                    : Colors.transparent,
              ),
              child: Center(
                child: Text(e.letter!,style: TextStyle(color:Colors.white,fontSize: 15.0,fontWeight: FontWeight.bold ),),
              ),
            )).toList()
        )).toList()
    );
  }
}