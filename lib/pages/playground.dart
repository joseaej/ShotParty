import 'package:flutter/material.dart';
import 'package:shotparty/pages/home/home_page.dart';
import 'package:shotparty/widgets/buttons.dart';

class Playground extends StatefulWidget {
  const Playground({super.key});

  @override
  State<Playground> createState() => _PlaygroundState();
}

class _PlaygroundState extends State<Playground> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          neonButton(
            context,
            text: "dsa",
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          SizedBox(height: 20),
          outlineNeoButton(context, text: "dasdas", onPressed: () {}),
          SizedBox(height: 20),
          squareNeonButton(context, text: "dasdas", onPressed: () {}),
          SizedBox(height: 20),
          circularNeonButton(
            context,
            icon: Icons.fire_extinguisher,
            onPressed: () {},
          ),
          SizedBox(height: 20),
          outlineSquareNeonButton(context, text: "dasdas", onPressed: () {}),
          SizedBox(height: 20),
          outlineCircularNeonButton(
            context,
            icon: Icons.fire_extinguisher,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
