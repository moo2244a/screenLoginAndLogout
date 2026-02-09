import 'package:flutter/material.dart';

import 'package:screenloginandlogout/core/theme/app_colors.dart';
import 'package:screenloginandlogout/core/theme/app_text_style.dart';
import 'package:screenloginandlogout/features/auth/logic/sign_up_use_case.dart';
import 'package:screenloginandlogout/features/auth/wedgets/app_logo.dart';
import 'package:screenloginandlogout/features/auth/wedgets/custom_elevated_button.dart';
import 'package:screenloginandlogout/features/auth/wedgets/custom_text_field.dart';
import 'package:screenloginandlogout/features/auth/wedgets/generic_text_button.dart';
import 'package:screenloginandlogout/features/auth/wedgets/or_divider.dart';
import 'package:screenloginandlogout/features/auth/wedgets/password_visibility_toggle.dart';
import 'package:screenloginandlogout/features/auth/wedgets/snack_bar_message.dart';
import 'package:screenloginandlogout/features/auth/wedgets/title_of_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isObscureText = true;
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerConfirmPassword =
      TextEditingController();
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final SnackBarMessage snackBarMessage = SnackBarMessage();
  void addUser() {
    final useCase = SignUpUseCase();

    final resultMessage = useCase.execute(
      name: controllerName.text,
      email: controllerEmail.text,
      phone: controllerPhone.text,
      password: controllerPassword.text,
      confirmPassword: controllerConfirmPassword.text,
    );

    final isSuccess = resultMessage == "Account created successfully";

    if (isSuccess) {
      Navigator.pop(context);
    }

    snackBarMessage(context, resultMessage, isSuccess);
  }

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
                  TitleOfScreen(
                    text: "Sign Up",
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomTextField(
                    title: 'Name',
                    hintText: 'Enter your name',
                    controller: controllerName,
                  ),
                  CustomTextField(
                    title: 'Phone',
                    hintText: 'Enter your phone',
                    controller: controllerPhone,
                    keyboardType: TextInputType.phone,
                  ),
                  CustomTextField(
                    title: 'Email',
                    hintText: 'Enter your email',
                    controller: controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  CustomTextField(
                    title: 'Password',
                    hintText: 'Enter your password',
                    controller: controllerPassword,
                    obscureText: isObscureText,
                    suffixIcon: PasswordVisibilityToggle(
                      isObscure: isObscureText,
                      onToggle: () {
                        setState(() {
                          isObscureText = !isObscureText;
                        });
                      },
                    ),
                  ),
                  CustomTextField(
                    title: 'Confirm Password',
                    hintText: 'Enter your Confirm password',
                    controller: controllerConfirmPassword,
                    obscureText: isObscureText,
                    suffixIcon: PasswordVisibilityToggle(
                      isObscure: isObscureText,
                      onToggle: () {
                        setState(() {
                          isObscureText = !isObscureText;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20),

                  CustomElevatedButton(
                    padding: 20,
                    text: 'CREATE ACCOUNT',
                    onPressed: () {
                      addUser();
                    },
                  ),
                  SizedBox(height: 20),
                  OrDivider(),
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: .center,
                      children: [
                        Text(
                          "Already have an account ?",
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
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
