import 'package:flutter/material.dart';
import 'package:screenloginandlogout/core/theme/app_colors.dart';
import 'package:screenloginandlogout/core/theme/app_text_style.dart';
import 'package:screenloginandlogout/features/auth/wedgets/app_logo.dart';
import 'package:screenloginandlogout/features/auth/wedgets/custom_elevated_button.dart';
import 'package:screenloginandlogout/features/auth/wedgets/custom_text_field.dart';
import 'package:screenloginandlogout/features/auth/wedgets/generic_text_button.dart';
import 'package:screenloginandlogout/features/auth/wedgets/snack_bar_message.dart';
import 'package:screenloginandlogout/features/auth/wedgets/title_of_screen.dart';

class ForgotScreen extends StatelessWidget {
  ForgotScreen({super.key});
  final SnackBarMessage snackBarMessage = SnackBarMessage();
  final TextEditingController controllerEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 35),
                    child: AppLogo(height: 40, width: 190),
                  ),
                  TitleOfScreen(text: "Forgot Password ?", fontSize: 20),
                  SizedBox(height: 10),
                  CustomTextField(
                    title: 'Email',
                    hintText: 'Enter your email',
                    controller: controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  CustomElevatedButton(
                    padding: 20,
                    text: 'SEND RESET LINK',
                    onPressed: () {
                      if (controllerEmail.text.isNotEmpty) {
                        Navigator.pop(context);
                        snackBarMessage(
                          context,
                          "A verification email has been sent to ${controllerEmail.text}. Please activate your account.",
                          true,
                        );
                      } else {
                        snackBarMessage(context, "Email is required", false);
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: .center,
                      children: [
                        Text(
                          " Remember your password ?",
                          style: AppTextStyles.subTitle.copyWith(fontSize: 17),
                        ),
                        GenericTextButton(
                          alignment: Alignment.center,
                          text: "Sign In",
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
