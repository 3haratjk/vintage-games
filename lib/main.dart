import 'package:flutter/material.dart';
import 'package:vintage_games/view_games.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Skill Builder',
      home: Scaffold(
        body: ViewGames(),
      ),
    );
  }
}
