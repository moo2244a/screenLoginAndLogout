import 'package:flutter/material.dart';
import 'package:screenloginandlogout/core/theme/app_colors.dart';
import 'package:screenloginandlogout/core/theme/app_text_style.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(thickness: 2)),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 5),
          child: Text(
            "Or",
            style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
          ),
        ),
        Expanded(child: Divider(thickness: 2)),
      ],
    );
  }
}
