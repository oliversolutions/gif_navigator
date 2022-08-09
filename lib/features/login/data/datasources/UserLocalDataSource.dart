import 'package:gif_navigator/features/login/domain/entities/User.dart';
import 'UserGenerator.dart';

abstract class UserLocalDataSource {
  List<User> getUsers();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final UserGenerator userGenerator;

  UserLocalDataSourceImpl({required this.userGenerator});
  
  @override
  List<User> getUsers() {
    return userGenerator.getUsers();
  }
}
