import 'package:mat2414/src/data/models/models.dart';

abstract class IUserRepository {
  User get user;

  Future<void> update(User user);

  Future<void> init();
}
