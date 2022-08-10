import 'package:gif_navigator/features/login/data/datasources/user_local_data_source.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';

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
