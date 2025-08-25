import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shotparty/models/providers/player_provider.dart';
import 'package:shotparty/pages/playground.dart';
import 'package:shotparty/widgets/buttons.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> jugadores = [];
  late final PlayerProvider playerProvider;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    playerProvider = Provider.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 5.h,),
            Image.asset(
              'assets/icons/shotparty_icon.png',
              height: 20.h,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 4.h),
            Container(
              width: 80.w,
              height: 50.h,
              padding: EdgeInsets.all(3.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: theme.primary,
                  width: 2,
                ),
                
              ),
              child: Column(
                children: [
                  Text(
                    "Jugadores",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: playerProvider.players.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.person, color: theme.secondary),
                          title: Text(
                            jugadores[index],
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.close, color: theme.primary),
                            onPressed: () {
                              setState(() {
                                jugadores.removeAt(index);
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),

                  TextButton.icon(
                    onPressed: () {
                      
                    },
                    icon: Icon(Icons.add, color: Colors.pinkAccent),
                    label: Text(
                      "Añadir jugador",
                      style: TextStyle(color: Colors.cyanAccent),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 4.h),

            // Botón principal
            neonButton(
              context,
              text: "Comenzar",
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Playground()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
