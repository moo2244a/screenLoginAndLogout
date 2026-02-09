import 'package:screenloginandlogout/core/constants/list_of_users.dart';

class SignUpUseCase {
  SignUpUseCase();

  String execute({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) {
    if (name.trimLeft().isEmpty ||
        email.trimLeft().isEmpty ||
        phone.trimLeft().isEmpty ||
        password.trimLeft().isEmpty ||
        confirmPassword.trimLeft().isEmpty) {
      return "All fields are required";
    }

    if (password != confirmPassword) {
      return "Password does not match Confirm Password";
    }

    final isEmailExist = listOfUsers.any((u) => u.email == email);
    if (isEmailExist) {
      return "Email already exists";
    }

    listOfUsers.add(
      UserModel(
        id: listOfUsers.length + 1,
        name: name,
        email: email,
        phone: phone,
        password: password,
      ),
    );

    return "Account created successfully";
  }
}
