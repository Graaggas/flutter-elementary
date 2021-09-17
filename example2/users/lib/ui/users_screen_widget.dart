import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:users/ui/users_screen_model_widget.dart';

class UsersScreenWidget extends WMWidget<IUsersScreenWM> {
  const UsersScreenWidget({
    Key? key,
    WidgetModelFactory wmFactory = usersScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IUsersScreenWM wm) {
    return Scaffold(
      body: Center(
        child: EntityStateNotifierBuilder(
          listenableEntityState: wm.valueState,
          loadingBuilder: (_, data) {
            return const CircularProgressIndicator();
          },
          builder: (_, data) {
            return Text(data.toString());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          wm.getRandomUserName();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
