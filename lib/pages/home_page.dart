import 'package:erni/models/user_model.dart';
import 'package:erni/providers/viewmodels/users_list_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Selector<UsersListViewModel, UserListState>(
        selector: (_, UsersListViewModel viewModel) => viewModel.currentState,
        builder: (_, UserListState state, __) {
          switch (state) {
            case UserListState.INITIAL:
            case UserListState.LOADING:
              return Center(child: CircularProgressIndicator.adaptive());
            case UserListState.SUCCESS:
              return _UserListView(
                users: context.read<UsersListViewModel>().users,
              );
            case UserListState.ERROR:
              return Center(child: Text('Oh no. Something went wrong.'));
          }
        },
      ),
    );
  }
}

class _UserListView extends StatelessWidget {
  const _UserListView({
    Key? key,
    required this.users,
  }) : super(key: key);

  final List<UserModel> users;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (_, int index) => ListTile(
        leading: CircleAvatar(
          backgroundImage: Image.network(
            users[index].imageUrl,
            errorBuilder: (context, error, stackTrace) => Text(
              users[index].name[0],
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ).image,
        ),
        title: Text(users[index].name),
      ),
    );
  }
}
