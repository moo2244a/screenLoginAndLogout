import 'package:screenloginandlogout/core/constants/list_of_users.dart';

class SignInUseCase {
  SignInUseCase();

  bool _isEmailExists(UserModel user, List<UserModel> users) {
    return users.any((u) => u.email == user.email);
  }

  bool _isPasswordCorrect(UserModel user, List<UserModel> users) {
    return users.any(
      (u) => u.email == user.email && u.password == user.password,
    );
  }

  String execute(UserModel user, List<UserModel> usersList) {
    if (user.email.isEmpty || user.password.isEmpty) {
      return "All fields are required";
    }

    if (!_isEmailExists(user, usersList)) {
      return "No account found with this email";
    }

    if (!_isPasswordCorrect(user, usersList)) {
      return "Account exists, but the password is incorrect";
    }

    return "Registration completed successfully";
  }
}
