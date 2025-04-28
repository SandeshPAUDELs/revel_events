import 'package:event_app/common/style/common_style.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:flutter/widgets.dart';

class ContainerStyles {
  static Container createContainer(
    BuildContext context,
    String event_type,
    Color color,
  ) {
    final textTheme = TextThemes.createTextTheme(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: CommonStyle.screenPadding,
        vertical: 0,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(CommonStyle.contanersPadding),
      ),
      child: Text(
        event_type,
        style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
      ),
    );
  }
}
