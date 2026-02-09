import 'package:flutter/material.dart';
import 'package:screenloginandlogout/core/constants/app_assets.dart';

class AppLogo extends StatelessWidget {
  final double height;
  final double width;

  const AppLogo({super.key, this.height = 40, this.width = 190});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(AppAssets.imageLogo),
        ),
      ),
    );
  }
}
