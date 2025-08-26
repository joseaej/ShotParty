import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:provider/provider.dart';
import 'package:shotparty/models/providers/player_provider.dart';
import 'package:shotparty/widgets/buttons.dart';
import 'package:shotparty/widgets/wheel_selected_item.dart';
import 'package:sizer/sizer.dart';

class FortuneWheelGame extends StatefulWidget {
  const FortuneWheelGame({super.key});

  @override
  State<FortuneWheelGame> createState() => _FortuneWheelGameState();
}

class _FortuneWheelGameState extends State<FortuneWheelGame> {
  final StreamController<int> selected = StreamController<int>();
  final wheelItems = <String>['Reto', 'Verdad', 'Chupito'];
  int? lastSelected;
  final Random randomPleopleIndex = Random();
  late final playerProvider;
  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  void _spinWheel() {
    final index = Fortune.randomInt(0, wheelItems.length);
    lastSelected = index;
    selected.add(index);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final whelColors = [
      theme.colorScheme.primary,
      theme.colorScheme.secondary,
      theme.colorScheme.tertiary,
    ];
    playerProvider = Provider.of<PlayerProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 5.h),
          Expanded(
            child: FortuneWheel(
              selected: selected.stream,
              indicators: <FortuneIndicator>[
                FortuneIndicator(
                  alignment: Alignment.topCenter,
                  child: TriangleIndicator(color: theme.colorScheme.primary),
                ),
              ],
              items: [
                for (var i = 0; i < wheelItems.length; i++)
                  FortuneItem(
                    child: Text(
                      wheelItems[i],
                      style: TextStyle(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: FortuneItemStyle(
                      color: whelColors[i % whelColors.length],
                      borderColor: Colors.white,
                      borderWidth: 2,
                    ),
                  ),
              ],
              physics: CircularPanPhysics(
                duration: const Duration(seconds: 2),
                curve: Curves.decelerate,
              ),
              onAnimationEnd: () {
                if (lastSelected != null) {
                  final winner = wheelItems[lastSelected!];
                  showWheelDialog(winner);
                }
              },
            ),
          ),
          outlineNeoButton(
            context,
            text: "Girar ruleta",
            onPressed: _spinWheel,
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  void showWheelDialog(String winner) {
    switch (winner) {
      case "Reto":
        if (playerProvider.players.isNotEmpty) {
          final randomPlayer =
              playerProvider.players[randomPleopleIndex.nextInt(
                playerProvider.players.length,
              )];
          challengeDialogItem(context, peopleName: randomPlayer.name);
        }
        break;
      case "Verdad":
        // TODO: lógica para "Verdad"
        break;
      case "Chupito":
        // TODO: lógica para "Chupito"
        break;
    }
  }
}
