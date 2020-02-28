import 'package:flutter/material.dart';

class ChessUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return makeLayout();
  }

  Widget makeLayout() {
    return Container(
      alignment: Alignment.center,
      color: Colors.deepOrangeAccent,
      height: 20.0,
      width: 20.0,
      child: Image.asset(
        "assets/images/chess_board.png",
        height: 350,
        width: 350,
      ),
    );
  }

// class HelloYou extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => HelloYouState();
// }

// class HelloYouState extends State<HelloYou> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         child: Image.asset("assets/images/chess_board.png"),
//         // width: 48.0,
//         // height: 48.0,
//       ),
//     );
//   }
}
