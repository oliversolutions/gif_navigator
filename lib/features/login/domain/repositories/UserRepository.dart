import '../entities/User.dart';

abstract class UserRepository {
  List<User> getUsers();
}
