import 'package:gif_navigator/features/login/data/datasources/UserLocalDataSource.dart';
import '../../domain/entities/User.dart';
import '../../domain/repositories/UserRepository.dart';

class UserRepositoryImpl implements UserRepository {

  final UserLocalDataSource localDataSource;
  UserRepositoryImpl({
    required this.localDataSource
  });

  @override
  List<User> getUsers() {
    return localDataSource.getUsers();
  }
}
