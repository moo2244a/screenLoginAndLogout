import 'package:flutter/material.dart';
import 'package:screenloginandlogout/core/constants/list_of_users.dart';
import 'package:screenloginandlogout/core/theme/app_colors.dart';
import 'package:screenloginandlogout/features/auth/logic/sign_in_use_case.dart';
import 'package:screenloginandlogout/features/auth/screens/forgot_screen.dart';
import 'package:screenloginandlogout/features/auth/screens/sign_up_screen.dart';
import 'package:screenloginandlogout/features/auth/wedgets/app_logo.dart';
import 'package:screenloginandlogout/features/auth/wedgets/custom_elevated_button.dart';
import 'package:screenloginandlogout/features/auth/wedgets/custom_text_field.dart';
import 'package:screenloginandlogout/features/auth/wedgets/generic_text_button.dart';
import 'package:screenloginandlogout/features/auth/wedgets/or_divider.dart';
import 'package:screenloginandlogout/features/auth/wedgets/password_visibility_toggle.dart';
import 'package:screenloginandlogout/features/auth/wedgets/snack_bar_message.dart';
import 'package:screenloginandlogout/features/auth/wedgets/social_auth_buttons_column.dart';
import 'package:screenloginandlogout/features/auth/wedgets/title_of_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isObscureText = true;
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  final SnackBarMessage snackBarMessage = SnackBarMessage();

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
                    text: "Sign In",
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),

                  CustomTextField(
                    title: 'Email',
                    hintText: 'Enter your email',
                    controller: controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  CustomTextField(
                    title: 'Password',
                    controller: controllerPassword,
                    hintText: 'Enter your password',
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
                  GenericTextButton(
                    text: "Forgot Password ?",
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ForgotScreen()),
                      );
                    },
                  ),
                  CustomElevatedButton(
                    padding: 20,
                    text: 'NEXT',
                    onPressed: () {
                      final user = UserModel(
                        email: controllerEmail.text,
                        password: controllerPassword.text,
                      );

                      print(controllerPassword.text);
                      print(controllerEmail.text);

                      final useCase = SignInUseCase();
                      final message = useCase.execute(user, listOfUsers);

                      snackBarMessage(
                        context,
                        message,
                        message == "Registration completed successfully",
                      );
                    },
                  ),
                  SizedBox(height: 20),

                  OrDivider(),
                  SizedBox(height: 12),
                  SocialAuthButtonsColumn(
                    onApple: () {},
                    onFacebook: () {},
                    onGoogle: () {},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: GenericTextButton(
                      text: "Create a Account",
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      color: AppColors.textSecondary,
                      alignment: Alignment.center,
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
