import 'dart:collection';

import 'package:erni/common/errors.dart';
import 'package:erni/models/user_model.dart';
import 'package:erni/services/user_service.dart';
import 'package:flutter/material.dart';

enum UserListState {
  INITIAL,
  LOADING,
  SUCCESS,
  ERROR,
}

class UsersListViewModel extends ChangeNotifier {
  UsersListViewModel({
    required this.service,
  }) {
    _init();
  }

  final UserService service;

  LinkedHashMap<String, UserModel> _cache = LinkedHashMap<String, UserModel>();
  UnmodifiableListView<UserModel> get users =>
      UnmodifiableListView<UserModel>(List<UserModel>.from(_cache.values));

  UserListState _currentState = UserListState.INITIAL;
  UserListState get currentState => _currentState;

  Future<void> _init() async {
    try {
      final List<UserModel> users = await service.getUsers();
      for (final UserModel user in users) {
        _cache.putIfAbsent(user.id, () => user);
      }

      _currentState = UserListState.SUCCESS;
    } on NetworkException {
      _currentState = UserListState.ERROR;
    } catch (e) {
      _currentState = UserListState.ERROR;
    }

    notifyListeners();
  }
}
