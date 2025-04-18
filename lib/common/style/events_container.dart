import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:flutter/widgets.dart';

class ContainerStyles {
  static Container createContainer(BuildContext context, String event_type, Color color) {
    final textTheme = TextThemes.createTextTheme(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        event_type,
        style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
      ),
    );
  }
}
