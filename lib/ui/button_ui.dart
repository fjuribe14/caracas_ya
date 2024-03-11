import 'package:flutter/material.dart';

class ButtonUi extends StatelessWidget {
  final IconData? icon;
  final String label;
  final VoidCallback onPressed;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;

  const ButtonUi({
    super.key,
    this.icon,
    required this.label,
    required this.onPressed,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: Icon(icon),
      label: Text(label),
      onPressed: onPressed,
      style: style?.copyWith(
        padding: const MaterialStatePropertyAll(
            EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0)),
      ),
      focusNode: focusNode,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
    );
  }
}
