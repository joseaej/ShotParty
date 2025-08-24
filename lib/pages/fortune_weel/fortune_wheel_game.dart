import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
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

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  void _spinWheel() {
    final index = Fortune.randomInt(0, wheelItems.length);
    lastSelected = index; // lo guardamos
    selected.add(index); // lo enviamos al stream
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    List<Color> whelColors = [
      theme.colorScheme.primary,
      theme.colorScheme.secondary,
      theme.colorScheme.tertiary,
    ];
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
                  switch (winner) {
                    case "Reto":
                      challengeDialogItem(context,peopleName: "Jose");
                      break;

                    case "Verdad":
                      break;
                    case "Chupito":
                      
                      break;
                  }
                }
              },
            ),
          ),
          outlineNeoButton(context, text: "Girar ruleta", onPressed: _spinWheel),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
