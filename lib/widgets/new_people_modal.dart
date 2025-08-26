import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shotparty/models/player.dart';
import 'package:shotparty/models/providers/player_provider.dart';
import 'package:shotparty/widgets/buttons.dart';
import 'package:shotparty/widgets/rounded_text_field.dart';
import 'package:sizer/sizer.dart';

Future<void> newPeopleDialog(
  BuildContext context, {
  required TextEditingController textController,
}) {
  final theme = Theme.of(context).colorScheme;
  final playerProvider = Provider.of<PlayerProvider>(context, listen: false);

  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(5.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [theme.primary, Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ingrese un nombre",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: const [
                        Shadow(
                          blurRadius: 8,
                          color: Colors.black45,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white70,
                      size: 26,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 2.h),

              // Campo de texto
              RoundedTextField(
                hint: "Ej: Persona1",
                icon: Icons.people,
                controller: textController,
              ),

              SizedBox(height: 3.h),

              // Botón de acción
              elevatedDialogButton(
                context,
                text: "¡Vamos!",
                onPressed: () {
                  playerProvider.addPlayer(
                    Player(
                      id: DateTime.now().toIso8601String(),
                      name: textController.text.trim(),
                    ),
                  );
                  Navigator.of(context).pop();
                  textController.clear();
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
