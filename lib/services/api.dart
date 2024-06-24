import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:intern_task/model/profile.dart';
import 'package:intern_task/model/user.dart';

class ApiServices {
  Future<User?> getUser(String username, String password) async {
    var dio = Dio();
    var headers = {'Content-Type': 'application/json'};
    var data = json.encode(
        {"username": username, "password": password, "expiresInMins": 30});

    var response = await dio.request(
      'https://dummyjson.com/auth/login',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );
    if (response.statusCode == 200) {
      
      return User.fromJson(response.data);
    }
    return null;
  }

  Future<UserProfile?> getUserProfile(String token) async {
    var dio = Dio();
    // print(token);
    var headers = {'Authorization': token};

    var response = await dio.request(
      'https://dummyjson.com/auth/me',
      options: Options(
        method: 'GET',
        headers: headers,
      ),
    );
    if (response.statusCode == 200) {
      
      return UserProfile.fromJson(response.data);
    }
    return null;
  }
}
