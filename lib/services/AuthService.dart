import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_charge/data/api/api_service.dart';
import 'package:get_charge/data/models/User/User.dart';
import 'package:http/http.dart';

class AuthService {
  static FlutterSecureStorage storage = const FlutterSecureStorage();
  static String? token;
  static User? currentUser;

  static readTokenInStorage() async{
    token = await storage.read(key: 'token');
  }

  static Future<Response> setToken(String phone, String password) async {
    var response = await ApiService.post(method: 'connect/token', body: {
      'client_id': 'News_Service',
      'client_secret': 'News_Service_Secret',
      'grant_type': 'password',
      'username': phone,
      'password': password,
    });

    if(response.statusCode == 200){
      var responseBody = jsonDecode(response.body);
      await storage.write(key: 'token', value: responseBody['access_token']);
    }

    return response;
  }
}
