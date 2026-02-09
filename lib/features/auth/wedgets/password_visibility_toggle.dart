import 'package:flutter/material.dart';

class PasswordVisibilityToggle extends StatelessWidget {
  final bool isObscure;
  final VoidCallback onToggle;

  const PasswordVisibilityToggle({
    super.key,
    required this.isObscure,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onToggle,
      icon: Icon(
        isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
      ),
    );
  }
}
