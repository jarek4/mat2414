import 'package:mat2414/locator.dart';
import 'package:mat2414/src/data/models/user/user.dart';
import 'package:mat2414/src/domain/repositories/i_user_repository.dart';

import '../../domain/local_database/i_user_db_helper.dart';

class UserRepository implements IUserRepository {
  /// Always immediately call init()!
  UserRepository();

  final IUserDbHelper _db = locator<IUserDbHelper>();

  late User _currentUser;

  @override
  Future<void> update(User user) async {
    User? updated = await _db
        .update(user)
        .catchError((e) => null)
        .timeout(const Duration(seconds: 3), onTimeout: () => null);
    if (updated != null) _currentUser = updated;
  }

  @override
  User get user => _currentUser;
/*  User get user async {
    if (_currentUser != null) return _currentUser!;
    final User? fromDb = await _db
        .getCurrentUser()
        .catchError((e) => null)
        .timeout(const Duration(seconds: 3), onTimeout: () => null);
    if (fromDb != null) return _currentUser = fromDb;
    return _currentUser = User(createdAt: DateTime.now(), lastModified: DateTime.now(), id: 0);
  }*/

  @override
  Future<void> init() async{
    final User? fromDb = await _db
        .getCurrentUser()
        .catchError((e) => null)
        .timeout(const Duration(seconds: 3), onTimeout: () => null);
    if (fromDb != null) _currentUser = fromDb;
    _currentUser = User(createdAt: DateTime.now(), lastModified: DateTime.now(), id: 0);
    // print('UserRepository init() _currentUser: $_currentUser');
  }
}
