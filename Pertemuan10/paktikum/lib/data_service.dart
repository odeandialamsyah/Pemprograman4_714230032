import 'package:flutter/material.dart';

import 'user.dart';
import 'package:dio/dio.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: 'https://reqres.in/api',
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json; charset=UTF-8',
      'x-api-key': 'reqres_bbca121c38f748198e21e44314b34e2b',
    },
  ),
);

class DataService {
  Future<dynamic> getUsers() async {
    try {
      final res = await dio.get('/users');

      debugPrint('Status: ${res.statusCode}');
      debugPrint('Data: ${res.data}');
      return res.data;
    } catch (e) {
      debugPrint('Error: $e');
      return null;
    }
  }

  Future<dynamic> postUser(UserCreate user) async {
    try {
      final response = await dio.post('/users', data: user.toMap());

      debugPrint('Status: ${response.statusCode}');
      debugPrint('Data: ${response.data}');

      if (response.statusCode == 201) {
        return UserCreate.fromJson(response.data);
      }
    } on DioException catch (e) {
      debugPrint('DIO ERROR STATUS: ${e.response?.statusCode}');
      debugPrint('DIO ERROR DATA: ${e.response?.data}');
      return null;
    } catch (e) {
      debugPrint('Error: $e');
      return null;
    }
  }

  Future<UserUpdate?> putUser(String idUser, String name, String job) async {
    try {
      final response = await dio.put(
        '/users/$idUser',
        data: {'name': name, 'job': job},
      );

      if (response.statusCode == 200) {
        return UserUpdate.fromJson(response.data);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> deleteUser(String idUser) async {
    try {
      final response = await dio.delete('/users/$idUser');

      debugPrint('Status: ${response.statusCode}');
      debugPrint('Data: ${response.data}');

      if (response.statusCode == 204) {
        return 'User deleted successfully';
      } else {
        return 'Failed to delete user';
      }
    } on DioException catch (e) {
      debugPrint('DIO ERROR STATUS: ${e.response?.statusCode}');
      debugPrint('DIO ERROR DATA: ${e.response?.data}');
      return null;
    } catch (e) {
      debugPrint('Error: $e');
      return null;
    }
  }

  Future<Iterable<User>?> getUserModel() async {
    try {
      final res = await dio.get('/users');

      if (res.statusCode == 200) {
        final users = (res.data['data'] as List)
            .map((userJson) => User.fromJson(userJson))
            .toList();
        return users;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
