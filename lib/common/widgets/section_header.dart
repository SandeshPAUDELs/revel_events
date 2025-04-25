import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String sectionName;
  final bool? showActionButton;
  final VoidCallback? onActionButtonPressed;

  const SectionHeader({
    super.key,
    required this.sectionName,
    this.showActionButton = true,
    this.onActionButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
