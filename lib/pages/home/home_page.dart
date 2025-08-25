import 'package:flutter/material.dart';
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

  void _agregarJugador() {
    setState(() {
      jugadores.add("Jugador ${jugadores.length + 1}");
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
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
                  SizedBox(height: 2.h),

                  // Lista de jugadores con scroll
                  Expanded(
                    child: ListView.builder(
                      itemCount: jugadores.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.person, color: Colors.cyanAccent),
                          title: Text(
                            jugadores[index],
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.close, color: Colors.redAccent),
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

                  // Botón añadir jugador
                  TextButton.icon(
                    onPressed: _agregarJugador,
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
