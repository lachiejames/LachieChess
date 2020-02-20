import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Chess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Lachie Chess",
      home: Scaffold(
        appBar: AppBar(title: Text("Lachie Chess")),
        body: Material(),
      ),
    );
  }
}
