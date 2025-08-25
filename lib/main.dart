import 'package:flutter/material.dart';
import 'package:shotparty/pages/home/home_page.dart';
import 'package:shotparty/theme/neon_theme.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ShotParty',
            theme: AppTheme.neonTheme,
          darkTheme: AppTheme.neonTheme,
          home: HomePage(),
        );
      },
    );
  }
}
