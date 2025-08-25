import 'package:flutter/material.dart';
import 'package:shotparty/theme/neon_theme.dart';
import 'package:shotparty/utils/providers.dart';
import 'package:shotparty/utils/routes.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: constProvidersDef,
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'ShotParty',
            theme: AppTheme.neonTheme,
            darkTheme: AppTheme.neonTheme,
            routes: appRoutes,
            initialRoute: '/home',
          );
        },
      ),
    );
  }
}
