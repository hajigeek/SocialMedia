import 'package:http/http.dart';
import 'dart:convert';
import 'package:users/constants.dart';
import 'package:users/model/userModel.dart';
import 'dart:developer';

class apiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = ApiConstants.userBaseUrl + ApiConstants.userEndpoint;
      var response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
