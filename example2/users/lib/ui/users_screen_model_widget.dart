import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users/ui/users_screen_model.dart';
import 'package:users/ui/users_screen_widget.dart';

UsersScreenWidgetModel usersScreenWidgetModelFactory(BuildContext context) {
  final model = context.read<UsersScreenModel>();
  return UsersScreenWidgetModel(model);
}

class UsersScreenWidgetModel
    extends WidgetModel<UsersScreenWidget, UsersScreenModel>
    implements IUsersScreenWM {
  late EntityStateNotifier<String> _valueController;

  UsersScreenWidgetModel(UsersScreenModel model) : super(model);

  @override
  void getRandomUserName() {
    _valueController.loading();
    model.getRandomUserName().then((userName) {
      _valueController.content(userName);
    });
  }

  // ignore: member-ordering-extended
  @override
  ListenableState<EntityState<String>> get valueState => _valueController;

  @override
  void dispose() {
    _valueController.dispose();
    super.dispose();
  }

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    model
      ..getInitializeUsers()
      ..getRandomUserName();

    _valueController = EntityStateNotifier<String>.value(model.userName);
  }
}

abstract class IUsersScreenWM extends IWM {
  ListenableState<EntityState<String>> get valueState;

  void getRandomUserName();
}
