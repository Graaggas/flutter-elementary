import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:users/data/repo/users_repo.dart';
import 'package:users/data/repo/users_screen_interactors.dart';
import 'package:users/data/storage/api_client.dart';
import 'package:users/ui/users_screen_model.dart';
import 'package:users/ui/users_screen_widget.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (_) => ApiClient(httpClient: http.Client()),
        ),
        Provider(
          create: (context) => UsersRepo(apiClient: context.read<ApiClient>()),
        ),
        Provider(
          create: (ctx) =>
              UsersScreenInteractors(usersRepo: ctx.read<UsersRepo>()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Users Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider<UsersScreenModel>(
        create: (ctx) => UsersScreenModel(
          UsersErrorHandler(),
          usersScreenInteractors: ctx.read<UsersScreenInteractors>(),
        ),
        child: const UsersScreenWidget(),
      ),
    );
  }
}

class UsersErrorHandler implements ErrorHandler {
  @override
  void handleError(Object error) {
    // ignore: avoid_print
    print(error);
  }
}
