import '../entities/user.dart';

abstract class UserRepository {
  List<User> getUsers();
}
