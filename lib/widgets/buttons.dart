import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

Widget neonButton(
  BuildContext context, {
  required String text,
  required VoidCallback onPressed,
}) {
  final theme = Theme.of(context);
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(30),
    ),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 2.w),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: [
            Shadow(blurRadius: 10, color: theme.colorScheme.primary),
            Shadow(blurRadius: 20, color: theme.colorScheme.secondary),
          ],
        ),
      ),
    ),
  );
}

Widget outlineNeoButton(
  BuildContext context, {
  required String text,
  required VoidCallback onPressed,
}) {
  final theme = Theme.of(context);
  return ShaderMask(
    shaderCallback: (bounds) => LinearGradient(
      colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(bounds),
    blendMode: BlendMode.srcIn,
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: OutlinedButton(
        onPressed: onPressed,
        child: Text(text, style: theme.textTheme.bodyLarge),
      ),
    ),
  );
}

/// Botón cuadrado degradado relleno
Widget squareNeonButton(
  BuildContext context, {
  required String text,
  required VoidCallback onPressed,
}) {
  final theme = Theme.of(context);
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      borderRadius: BorderRadius.circular(0), // cuadrado
    ),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: [
            Shadow(blurRadius: 10, color: theme.colorScheme.primary),
            Shadow(blurRadius: 20, color: theme.colorScheme.secondary),
          ],
        ),
      ),
    ),
  );
}

/// Botón circular con degradado
Widget circularNeonButton(
  BuildContext context, {
  required IconData icon,
  required VoidCallback onPressed,
}) {
  final theme = Theme.of(context);
  return Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      shape: BoxShape.circle,
    ),
    child: IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white, size: 24.sp),
      splashRadius: 30,
    ),
  );
}

/// Botón con borde degradado cuadrado
Widget outlineSquareNeonButton(
  BuildContext context, {
  required String text,
  required VoidCallback onPressed,
}) {
  final theme = Theme.of(context);
  return ShaderMask(
    shaderCallback: (bounds) => LinearGradient(
      colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).createShader(bounds),
    blendMode: BlendMode.srcIn,
    child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ), // cuadrado
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: theme.textTheme.bodyLarge?.copyWith(fontSize: 18.sp),
      ),
    ),
  );
}

/// Botón solo icono con borde degradado circular
Widget outlineCircularNeonButton(
  BuildContext context, {
  required IconData icon,
  required VoidCallback onPressed,
}) {
  final theme = Theme.of(context);
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(width: 3, color: Colors.transparent),
    ),
    child: ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [theme.colorScheme.primary, theme.colorScheme.secondary],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      blendMode: BlendMode.srcIn,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: 24.sp),
        splashRadius: 30,
      ),
    ),
  );
}
