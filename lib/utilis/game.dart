import 'dart:math';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

// class Word {
//   String mot;
//   String definition;
//   String indice;
//
//   Word({required this.mot, required this.definition, required this.indice});
//
//   factory Word.fromJson(Map<String, dynamic> json) {
//     return Word(
//       mot: json['mot'],
//       definition: json['definition'],
//       indice: json['indice'],
//     );
//   }
// }
//
// List<Word> decodeJson(String jsonFile) {
//   List<Word> mots = [];
//
//   Map<String, dynamic> jsonData = json.decode(jsonFile);
//   List<dynamic> motsJson = jsonData['facile'];
//
//   motsJson.forEach((motJson) {
//     mots.add(Word.fromJson(motJson));
//   });
//
//   return mots;
// }
//
// class WordGame {
//   int rowId = 0;
//   int letterId = 0;
//
//   static String message = "";
//   static String guess='';
//   static List<Word> wordList = []; // Updated to store words from fetchWords()
//   static bool gameOver = false;
//
//   List<List<Letter>> wordBoard = [];
//
//   Future<void> initGame(String niveau) async {
//     final random = Random();
//     wordList = await fetchWords(niveau);
//     int index = random.nextInt(wordList.length);
//     guess = fetchWord('facile');
//     wordBoard = List.generate(5, (index) => List.generate(guess.length, (index) => Letter("", 0)));
//   }
//
//   void insertWord(int index, Letter letter) {
//     wordBoard[rowId][index] = letter;
//   }
//
//   bool checkWordExist(String word) {
//     return wordList.any((w) => w.mot.toUpperCase() == word.toUpperCase());
//   }
// }
//
// class Letter {
//   String? letter;
//   int code = 0;
//   Letter(this.letter, this.code);
// }
//
// Future<List<Word>> fetchWords(String level) async {
//   String jsonFile = await rootBundle.loadString('assets/words.json');
//   List<Word> words = decodeJson(jsonFile);
//
//   List<Word> wordList;
//   if (level == "facile") {
//     wordList = words.where((word) => word.mot.length <= 4).toList();
//   } else if (level == "intermediaire") {
//     wordList = words.where((word) => word.mot.length > 4 && word.mot.length <= 6).toList();
//   } else if (level == "difficile") {
//     wordList = words.where((word) => word.mot.length > 6).toList();
//   } else {
//     throw Exception("Niveau non valide");
//   }
//
//   return wordList;
// }
//
// Future<Word> fetchWord(String level) async {
//   List<Word> wordList = await fetchWords(level);
//
//   final random = Random();
//   int index = random.nextInt(wordList.length);
//
//   return wordList[index];
// }
//







import 'dart:math';


class WordGame {
  int rowId = 0;
  int letterId = 0;

  static String message = "";
  static String guess = "";
  static List<String> liste_mots = [
     "MANN","Pepsi","MONTAGNE","GRANDEUR"
    // Ajoutez d'autres mots ici
  ];

  static bool gameOver = false;

  List<List<Letter>> wordBoard = [];

  void initGame() {
    final random = Random();
    int index = random.nextInt(liste_mots.length);
    guess = liste_mots[index];
    wordBoard = List.generate(5, (index) => List.generate(guess.length, (index) => Letter("", 0)));
  }

  void insertWord(index, word) {
    wordBoard[rowId][index] = word;
  }

  bool checkWordExist(String word) {
    return liste_mots.contains(word.toUpperCase());
  }
}

class Letter {
  String? letter;
  int code = 0;
  Letter(this.letter, this.code);
}

