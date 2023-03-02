import 'package:mat2414/src/data/models/models.dart';

abstract class IUserDbHelper {
  Future<User?> getCurrentUser();

  Future<User?> update(User user);
}
