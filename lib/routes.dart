import 'package:erni/pages/home_page.dart';
import 'package:erni/providers/viewmodels/users_list_view_model.dart';
import 'package:erni/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final Map<String, Widget Function(BuildContext)> routes =
    <String, Widget Function(BuildContext)>{
  Routes.home: (_) => ChangeNotifierProvider<UsersListViewModel>(
        create: (_) => UsersListViewModel(
          service: _.read<UserService>(),
        ),
        child: const HomePage(),
      ),
};

class Routes {
  static const String home = '/home';
}
