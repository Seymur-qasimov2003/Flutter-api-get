import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/UsersModel.dart';

class UsersListServices {
  var url = 'https://reqres.in/api/users?page=2';
  Future<ListUsersModel> getUsersList() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return ListUsersModel.fromJson(data);
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
