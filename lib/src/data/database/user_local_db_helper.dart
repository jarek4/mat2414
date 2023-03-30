import 'package:isar/isar.dart';
import 'package:mat2414/locator.dart';
import 'package:mat2414/src/data/models/user/user.dart';
import 'package:mat2414/src/domain/local_database/i_user_db_helper.dart';


class UserLocalDbHelper implements IUserDbHelper {
  static final Isar _db = locator<Isar>();

  @override
  Future<User?> getCurrentUser() async {
    try {
      return await _db.users.get(1);
    } catch (e) {
      throw Exception('UserLocalDbHelper getCurrentUser.\n $e');
    }
  }

  @override
  Future<User?> update(User user) async {
    try {
      return await _db.writeTxn<User?>(() async {
        final int id = await _db.users.put(user.copyWith(lastModified: DateTime.now()));
        return await _db.users.get(id);
      });
    } catch (e) {
      throw Exception('UserLocalDbHelper edit($user).\n $e');
    }
  }
}
