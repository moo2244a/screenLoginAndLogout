import 'package:flutter/material.dart';
import 'package:screenloginandlogout/core/theme/app_colors.dart';
import 'package:screenloginandlogout/core/theme/app_text_style.dart';

class SocialAuthButton extends StatelessWidget {
  final Widget icon;
  final String text;

  final VoidCallback onPressed;

  const SocialAuthButton({
    super.key,
    required this.icon,
    required this.text,

    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),

      child: Row(
        children: [
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(23),
              onTap: onPressed,
              child: Container(
                height: 50,
                padding: EdgeInsets.symmetric(vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(23),
                  border: Border.all(
                    color: const Color(0xffb3b6b5),
                    width: 1.5,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon,
                    SizedBox(width: 10),
                    Text(
                      "Continue with $text",
                      style: AppTextStyles.subTitle.copyWith(
                        fontSize: 16,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
