import 'package:event_app/common/style/common_style.dart';
import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';

class TextFieldsTheme {
  static TextFormField createTextField(
    BuildContext context,
    TextEditingController controller,
    String hintText,
    void Function(String)? onSubmitted,
  ) {
    final textTheme = TextThemes.createTextTheme(context);
    return TextFormField(
      controller: controller,
      style: textTheme.bodyMedium!.copyWith(
        color: AppColors.textSecondaryColor,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: textTheme.bodyMedium?.copyWith(color: AppColors.textSecondaryColor),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(CommonStyle.borderRadius),
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        filled: true,
        fillColor: AppColors.cardSecondayColor,
      ),
      onFieldSubmitted: onSubmitted,
    );
  }

   static checkboxContainerforPages(
      BuildContext context, Icon checkboxIcon, VoidCallback? onTap) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: checkboxIcon,
        onPressed: onTap,
      ),
    );
  }
}