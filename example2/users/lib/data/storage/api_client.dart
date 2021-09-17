import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:users/data/models/user_model.dart';

class ApiClient {
  static const baseUrl = 'https://jsonplaceholder.typicode.com';

  final http.Client httpClient;

  ApiClient({required this.httpClient});

  Future<List<User>> fecthUsers() async {
    const mainUrl = '$baseUrl/users';

    final usersResponse = await httpClient.get(Uri.parse(mainUrl));

    if (usersResponse.statusCode != 200) {
      throw Exception('error getting users');
    }

    final usersList = (json.decode(usersResponse.body) as List)
        .cast<Map<String, dynamic>>()
        .map((e) => User.fromJson(e))
        .toList();

    return usersList;
  }
}
