import 'package:users/data/models/user_model.dart';
import 'package:users/data/storage/api_client.dart';

class UsersRepo {
  final ApiClient apiClient;

  UsersRepo({required this.apiClient});

  Future<List<User>> getUsers() async {
    final usersFromApi = await apiClient.fecthUsers();
    return usersFromApi;
  }
}
