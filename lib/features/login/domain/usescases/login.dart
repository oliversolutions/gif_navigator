import '../repositories/user_repository.dart';

class Login {

  final UserRepository repository;

  Login(this.repository);

  bool call(String username, String password) {
    for (final user in repository.getUsers()) {
      if (user.username == username && user.password == password) {
        return true;
      }
    }
    return false;
  }
}
