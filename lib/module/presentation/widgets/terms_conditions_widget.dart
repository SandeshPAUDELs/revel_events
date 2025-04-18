import 'package:event_app/core/config/themes/colors.dart';
import 'package:event_app/core/config/themes/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = TextThemes.createTextTheme(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Terms and Conditions', style: textTheme.bodySmall),
        const SizedBox(height: 10),
        Html(
          data: """
<li> 1. lorem ipsum dolor sit amet, consectetur adipiscing elit. 
 2. lorem ipsum dolor sit amet, consectetur adipiscing elit kjnknkjk  kj nknknk k knkn. </li>

""",
          style: {"li": Style(color: AppColors.textPrimaryColor)},
        ),
      ],
    );
  }
}
