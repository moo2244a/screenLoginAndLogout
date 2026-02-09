import 'package:flutter/material.dart';
import 'package:screenloginandlogout/core/theme/app_colors.dart';
import 'package:screenloginandlogout/core/theme/app_text_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.controller,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.name,
  });
  final String title;
  final String hintText;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,

            style: AppTextStyles.body.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(vertical: 5),

            child: TextField(
              controller: controller,
              obscureText: obscureText,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                hintText: hintText,

                suffixIcon: suffixIcon,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
