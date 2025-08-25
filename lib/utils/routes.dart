import 'package:flutter/material.dart';
import 'package:shotparty/pages/fortune_weel/fortune_wheel_game.dart';
import 'package:shotparty/pages/home/home_page.dart';
import 'package:shotparty/pages/playground.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/home': (context) => HomePage(),
  '/wheel': (context) => FortuneWheelGame(),
  '/playground': (context) => Playground(),
};