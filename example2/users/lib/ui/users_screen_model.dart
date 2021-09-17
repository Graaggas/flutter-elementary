import 'package:elementary/elementary.dart';

import 'package:users/data/repo/users_screen_interactors.dart';

class UsersScreenModel extends Model {
  final UsersScreenInteractors usersScreenInteractors;
  String get userName => _userName;

  var _userName = 'Loading...';

  UsersScreenModel(
    // ignore: avoid_unused_constructor_parameters
    ErrorHandler errorHandler, {
    required this.usersScreenInteractors,
  }) : super();

  void getInitializeUsers() {
    usersScreenInteractors.fetchUsers();
  }

  Future<String> getRandomUserName() async {
    try {
      _userName = await usersScreenInteractors.getRandomUserName();
      // ignore: avoid_catches_without_on_clauses, empty_catches
    } catch (e) {}
    return _userName;
  }
}
