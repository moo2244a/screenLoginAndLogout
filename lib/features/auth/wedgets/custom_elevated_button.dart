import 'package:flutter/material.dart';
import 'package:screenloginandlogout/core/theme/app_colors.dart';
import 'package:screenloginandlogout/core/theme/app_text_style.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.padding,
    required this.text,
    this.onPressed,
  });
  final double padding;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12),
                backgroundColor: Color(0xff5e64dd),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(7),
                ),
              ),
              onPressed: onPressed ?? () {},
              child: Text(
                text,
                style: AppTextStyles.body.copyWith(color: AppColors.background),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
