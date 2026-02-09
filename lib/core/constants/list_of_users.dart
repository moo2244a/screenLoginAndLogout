List<UserModel> listOfUsers = [];

class UserModel {
  final int? id;
  final String? name;
  final String email;
  final String? phone;
  final String password;

  UserModel({
    this.id,
    this.name,
    required this.email,
    this.phone,
    required this.password,
  });
}
