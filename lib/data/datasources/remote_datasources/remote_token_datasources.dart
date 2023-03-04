import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_charge/core/api/api.dart';
import 'package:get_charge/data/models/User/token_model.dart';

abstract class RemoteTokenDataSources {
  /// Calls the [baseUrl]/connect/token endpoint
  ///
  /// Throws a [DioError] for all error codes.
  Future<TokenModel> getToken({required String login, required String code});
}

class RemoteTokenDataSourcesImpl implements RemoteTokenDataSources {
  final Api api = Api();

  @override
  Future<TokenModel> getToken({required String login, required String code}) async {
    try {
      Response response = await api.post(query: 'identity/Login', isAuth: false, data: {'phoneNumber': login, 'password': code});

      return TokenModel.fromJson(response.data['tokens']);
    } on DioError {
      rethrow;
    }
  }
}
