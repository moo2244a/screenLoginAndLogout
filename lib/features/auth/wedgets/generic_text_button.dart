import 'package:flutter/material.dart';
import 'package:screenloginandlogout/core/theme/app_text_style.dart';

class GenericTextButton extends StatelessWidget {
  final String text;
  final Color? color;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final Alignment alignment;

  const GenericTextButton({
    super.key,
    required this.text,
    this.color,
    this.onPressed,
    this.textStyle,
    this.alignment = Alignment.centerRight,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,

          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        onPressed: onPressed ?? () {},
        child: Text(
          text,
          style:
              textStyle ??
              AppTextStyles.body.copyWith(
                color: color ?? const Color(0xff5e64dd),
              ),
        ),
      ),
    );
  }
}
