import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextThemes.createTextTheme(context);
    return Scaffold(
      backgroundColor: AppColors.cardBackgroundColor,
      body: Text('Event Screen', style: textTheme.headlineSmall),
    );
  }
}
