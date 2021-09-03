import 'package:erni/routes.dart';
import 'package:erni/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'env.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<UserService>(
      create: (_) => UserService(),
      child: MaterialApp(
        title: 'Erni Tech Task',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Routes.home,
        routes: routes,
      ),
    );
  }
}
