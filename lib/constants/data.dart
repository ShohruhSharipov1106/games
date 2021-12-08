import 'package:games/constants/imports.dart';

class Game {
  List<Widget> gameLeading = [
    const Icon(
      Icons.find_in_page_outlined,
      size: 28.0,
      color: Colors.black,
    ),
    const Icon(
      Icons.touch_app_outlined,
      size: 28.0,
      color: Colors.black,
    ),
    const Icon(
      Icons.cancel_outlined,
      size: 28.0,
      color: Colors.black,
    ),
  ];
  List<String> gameTitle = [
    "Finding Number",
    "Tapping",
    "Tic Tac Toe",
  ];
  List gamePage = [
    Find_Number(),
    TappingGame(),
    TicTacToe(),
  ];
}
