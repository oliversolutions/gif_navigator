import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({required int id, required String username, required String password}) : super(id: id, username: username, password: password);
}
