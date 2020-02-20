import 'package:flutter/material.dart';

import 'piece.dart';

class Board extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lachie Chess",
      home: Scaffold(
        appBar: AppBar(title: Text("Lachie Chess")),
        body: Material(
          child: Center(child: Piece()),
        ),
      ),
    );
  }
}
