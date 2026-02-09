import 'package:flutter/material.dart';
import 'package:screenloginandlogout/core/constants/app_assets.dart';
import 'package:screenloginandlogout/features/auth/wedgets/social_auth_button.dart';

class SocialAuthButtonsColumn extends StatelessWidget {
  final void Function()? onApple;
  final void Function()? onGoogle;
  final void Function()? onFacebook;

  const SocialAuthButtonsColumn({
    super.key,
    this.onApple,
    this.onGoogle,
    this.onFacebook,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialAuthButton(
          icon: Icon(Icons.apple, size: 42),
          text: 'Apple',

          onPressed: () {},
        ),

        SocialAuthButton(
          icon: CircleAvatar(
            radius: 16,
            backgroundImage: AssetImage(AppAssets.googleLogo),
          ),
          text: 'Google',
          onPressed: () {},
        ),

        SocialAuthButton(
          icon: Icon(Icons.facebook, size: 35, color: Color(0xff1579f6)),
          text: 'Facebook',
          onPressed: () {},
        ),
      ],
    );
  }
}
