import 'package:flutter/material.dart';
import 'package:screenloginandlogout/features/auth/screens/sign_in_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SignInScreen());
  }
}
