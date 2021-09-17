import 'dart:math';

import 'package:users/data/models/user_model.dart';
import 'package:users/data/repo/users_repo.dart';

class UsersScreenInteractors {
  static bool flagFetchedUsers = false;
  final UsersRepo usersRepo;
  List<User> _userList = [];

  UsersScreenInteractors({required this.usersRepo});

  Future<void> fetchUsers() async {
    _userList = await usersRepo.getUsers();
    flagFetchedUsers = true;
  }

  Future<String> getRandomUserName() async {
    if (flagFetchedUsers == true) {
      final randomUserIndex = getRandomIndex(_userList.length);
      return _userList[randomUserIndex].name;
    } else {
      _userList = await usersRepo.getUsers();
      final randomUserIndex = getRandomIndex(_userList.length);
      return _userList[randomUserIndex].name;
    }
  }
}

int getRandomIndex(int userListLength) {
  final rnd = Random();
  final randomUserIndex = 0 + rnd.nextInt(userListLength);
  return randomUserIndex;
}
