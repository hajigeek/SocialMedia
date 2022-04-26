import 'package:http/http.dart';
import 'dart:convert';
import 'package:users/constants.dart';
import 'package:users/model/postModel.dart';
import 'dart:developer';

class apiServicePost {
  Future<List<PostModel>?> getPosts() async {
    try {
      var url = ApiConstants.postBaseUrl + ApiConstants.postEndpoint;
      var response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<PostModel> _model = postModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
