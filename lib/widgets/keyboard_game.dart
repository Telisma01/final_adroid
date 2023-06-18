import 'package:flutter/material.dart';
import 'package:test_aprann/utilis/game.dart';
import 'package:test_aprann/widgets/board_game.dart';
// import 'package:audioplayers/audioplayers.dart';
class KeyboardGame extends StatefulWidget {
      KeyboardGame(this.game,{Key? key}) : super(key: key);
      WordGame game;
      @override
      State<KeyboardGame> createState() => _KeyboardGameState();
}

class _KeyboardGameState extends State<KeyboardGame> {
      //clavier du jeu
      List row1 = "QWERTYUIOP".split("");
      List row2 = "ASDFGHJKL".split("");
      List row3= ["DEl","Z","X","C","V","B","N","M","OK"];
      // AudioPlayer audioPlayer = AudioPlayer();
      @override
      Widget build(BuildContext context) {
            return Column(
                  // commencons par construire le clavier
                children: [
                      Text(WordGame.message,style: TextStyle(color: Colors.white,)),
                      SizedBox(height:20.0 ),
                      BoardGame(widget.game),
                      SizedBox(height: 20.0),

                      Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: row1.map((e){
                                  return InkWell(
                                        onTap: (){
                                              print(e);

                                              if (widget.game.letterId<WordGame.guess.length){
                                                    setState(() {
                                                          widget.game.insertWord(widget.game.letterId, Letter(e, 0));
                                                          widget.game.letterId++;
                                                    });
                                              }
                                        },
                                        child : Container(
                                              padding: EdgeInsets.all(10.0),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  color: Colors.grey.shade300
                                              ),
                                              child: Text(
                                                    "${e}",
                                                    style: TextStyle(
                                                          fontSize: 18.0,
                                                          fontWeight: FontWeight.bold,
                                                    ),
                                              ),
                                        ),
                                  );
                            }).toList(),
                      ),
                      SizedBox(
                            height: 10.0,
                      ),
                      Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: row2.map((e){
                                  return InkWell(
                                        onTap: (){
                                              print(e);
                                              if (widget.game.letterId < WordGame.guess.length){
                                                    setState(() {
                                                          widget.game.insertWord(widget.game.letterId, Letter(e, 0));
                                                          widget.game.letterId++;
                                                    });
                                              }
                                        },
                                        child : Container(
                                              padding: EdgeInsets.all(10.0),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  color: Colors.grey.shade300
                                              ),
                                              child: Text(
                                                    "${e}",
                                                    style: TextStyle(
                                                          fontSize: 18.0,
                                                          fontWeight: FontWeight.bold,
                                                    ),
                                              ),
                                        ),
                                  );
                            }).toList(),
                      ),
                      SizedBox(
                            height: 10.0,
                      ),
                      Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: row3.map((e){
                                  return InkWell(
                                        onTap: (){
                                              print(e);
                                              if(e == "DEl"){
                                                    if(widget.game.letterId>0){
                                                          setState(() {
                                                                widget.game.insertWord(
                                                                    widget.game.letterId -1, Letter("",0));
                                                                widget.game.letterId--;
                                                          });
                                                    }
                                              }else if(e== "OK"){
                                                    if(widget.game.letterId >= WordGame.guess.length){
                                                          String gues = widget.game.wordBoard[widget.game.rowId]
                                                              .map((e) => e.letter).join();
                                                          if(widget.game.checkWordExist(gues)){
                                                                if(gues== WordGame.guess){
                                                                      setState(() {
                                                                            WordGame.message = "Congratulations ";
                                                                            widget.game.wordBoard[widget.game.rowId].forEach((element) {
                                                                                  element.code=1;
                                                                            });
                                                                      });
                                                                }

                                                          }
                                                          else{setState(() {
                                                                WordGame.message= "the word is incorrect";
                                                                int listlength = gues.length;
                                                                for(int i=0;i < listlength;i++){
                                                                      String char = gues[i];
                                                                      if(WordGame.guess.contains(char)){
                                                                            if(WordGame.guess[i]==char){
                                                                                  setState(() {
                                                                                        widget.game.wordBoard[widget.game.rowId][i].code=1;
                                                                                  });
                                                                            }else{
                                                                                  setState(() {
                                                                                        widget.game.wordBoard[widget.game.rowId][i].code=2;
                                                                                  });
                                                                            }
                                                                      }}
                                                                widget.game.rowId++;
                                                                widget.game.letterId=0;
                                                          });

                                                          }
                                                    }}else{
                                                    if (widget.game.letterId<WordGame.guess.length){
                                                          setState(() {
                                                                widget.game.insertWord(widget.game.letterId, Letter(e, 0));
                                                                widget.game.letterId++;
                                                          });
                                                    }}
                                        },

                                        child : Container(
                                              padding: EdgeInsets.all(10.0),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  color: Colors.grey.shade300
                                              ),
                                              child: Text(
                                                    "${e}",
                                                    style: TextStyle(
                                                          fontSize: 18.0,
                                                          fontWeight: FontWeight.bold,
                                                    ),
                                              ),
                                        ),
                                  );
                            }).toList(),
                      ),
                ]

            );
      }
}

