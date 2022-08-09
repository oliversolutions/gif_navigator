import '../models/UserModel.dart';

class UserGenerator {
  List<UserModel> getUsers() {
    return [
      const UserModel(id: 1, username: 'ofernandez', password: '123456'),
      const UserModel(id: 2, username: 'ptom', password: 'vyiBB&%cH853'),
      const UserModel(id: 3, username: 'hector23', password: '6F8qWz65%*2&'),
      const UserModel(id: 4, username: 'fernando', password: '123456')
    ];
  }
}