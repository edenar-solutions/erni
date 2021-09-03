import 'dart:convert';

import 'package:erni/common/errors.dart';
import 'package:erni/env.dart';
import 'package:erni/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<List<UserModel>> getUsers() async {
    try {
      final http.Response result = await http.get(
        Uri.parse(
          Env.endPoint,
        ),
        headers: {
          'Content-type': 'application/json',
        },
      );

      if (result.statusCode != 200) {
        throw NetworkException();
      }

      final List<dynamic> rawData = jsonDecode(result.body);
      return rawData.map((e) => UserModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
