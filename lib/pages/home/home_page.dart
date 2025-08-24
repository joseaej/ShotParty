import 'package:flutter/material.dart';
import 'package:shotparty/pages/fortune_weel/fortune_wheel_game.dart';
import 'package:shotparty/widgets/buttons.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B0B1F), // fondo oscuro como en tu imagen
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/icons/shotparty_icon.png',
              height: 50.h,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 5.h), // espacio entre la imagen y el botón
            outlineNeoButton(
              context,
              text: "Jugar",
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => FortuneWheelGame()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}