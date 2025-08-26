import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shotparty/models/providers/player_provider.dart';
import 'package:shotparty/widgets/buttons.dart';
import 'package:shotparty/widgets/new_people_modal.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final playerProvider = Provider.of<PlayerProvider>(context);
    final TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 5.h),
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
                border: Border.all(color: theme.primary, width: 2),
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
                        final player = playerProvider.players[index];
                        return ListTile(
                          leading: Icon(Icons.person, color: theme.secondary),
                          title: Text(
                            player.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.close, color: theme.primary),
                            onPressed: () {
                              playerProvider.removePlayer(player.id);
                            },
                          ),
                        );
                      },
                    ),
                  ),

                  TextButton.icon(
                    onPressed: () {
                      newPeopleDialog(context,textController: textEditingController);
                    },
                    icon: const Icon(Icons.add, color: Colors.pinkAccent),
                    label: const Text(
                      "Añadir jugador",
                      style: TextStyle(color: Colors.cyanAccent),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 4.h),

            neonButton(
              context,
              text: "Comenzar",
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  "/wheel"
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
