import 'dart:convert';

import 'package:get_charge/data/api/api_service.dart';
import 'package:get_charge/data/models/User/ProfileView.dart';
import 'package:http/http.dart';

class ProfilesController {


  static Future<ProfileView?> getProfile() async {
    Response response = await ApiService.get(method: 'profile/GetProfile');
    Map<String, dynamic> profileMap = json.decode(response.body);
    if(response.statusCode == 200){
      return ProfileView.formMap(profileMap);
    }
    return null;
  }

  static Future<bool> changeEmail() async {
    Response response = await ApiService.get(method: 'profile/ChangeEmail');
    if(response.statusCode / 200 == 1){
      return true;
    }
    return false;
  }

}