import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_charge/core/api/loger.dart';
import 'package:get_charge/core/api/token_storage_model.dart';
import 'package:unique_identifier/unique_identifier.dart';

enum _Types {
  post,
  get,
  delete,
}

class Api {
  static TokenStorageModel? token;
  static String? deviceId;
  final Map<String, String>? urls;
  static Api? _api;
  final Dio dio = Dio();
  static const bool testMode = true;
  static const bool printMode = false;

  static const FlutterSecureStorage storage = FlutterSecureStorage();
  static const String storageKey = 'network_api_token';
  static const String deviceIdKey = 'network_api_device_id';

  static init({required urls}) async {
    await _getDeviceId();
    await _readLocalStorageToken();
    _api = Api._init(urls: urls);
  }

  Api._init({this.urls});

  factory Api() {
    return _api ??= Api._init();
  }

  static Future<void> writeLocalStorageToken(TokenStorageModel? newToken) async {
    token = newToken;
    if(newToken == null){
      storage.delete(key: storageKey);
    }else{
      storage.write(key: storageKey, value: jsonEncode(newToken.toJson()));
    }
  }

  static Future<void> _readLocalStorageToken() async {
    String? storageString = await storage.read(key: storageKey);
    TokenStorageModel? localToken = storageString != null ? TokenStorageModel.fromJson(jsonDecode(storageString)) : null;
    token = localToken;
  }

  static _getDeviceId() async {

    var countDeviceId = await storage.read(key: deviceIdKey);
    if (countDeviceId == null) {
      String? uuid = await UniqueIdentifier.serial;
       deviceId = uuid;
    }else{
      deviceId = countDeviceId;
    }
  }

  Future<Response> post({required String query, Map<String, dynamic>? data, bool? isAuth, String? urlsNane}) async {
    return await _request(query: query, data: data, isAuth: isAuth, type: _Types.post, urlsNane: urlsNane);
  }

  Future<Response> get({required String query, Map<String, dynamic>? data, bool? isAuth, String? urlsNane}) async {
    return await _request(query: query, queries: data, isAuth: isAuth, type: _Types.get, urlsNane: urlsNane);
  }

  Future<dynamic> _request({
    required String query,
    Map<String, dynamic>? data,
    String? urlsNane,
    required _Types type,
    required bool? isAuth,
    Map<String, String>? headers,
    Map<String, dynamic>? queries,
    Function(int, int)? onSendProgress,
    Function(int, int)? onReceiveProgress,
    CancelToken? cancelToken,
  }) async {
    Logger.log(data.toString(), name: 'API TEST ${type.name}: Query List', printMode: printMode);

    String url = (urls?[urlsNane ?? urls?.keys.first] ?? '') + query;

    try {
      headers ??= {};
      if (testMode) {
        if (isAuth ?? true) {
          headers.addAll({'Authorization': 'Bearer ${token?.token ?? ''}'});
          Logger.log(token?.token ?? 'Token empty', name: 'API TEST ${type.name}: Token', printMode: printMode);
        }
        Logger.log(headers.toString(), name: 'API TEST ${type.name}: Headers', printMode: printMode);
      }

      Response response = await dio.request(
        url,
        queryParameters: queries,
        data: !(type == _Types.get || type == _Types.delete) ? data : null,
        options: Options(headers: headers, method: type.name, contentType: Headers.jsonContentType),
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        cancelToken: cancelToken,
      );

      if (testMode) {
        Logger.log(response.realUri.toString(), name: 'API TEST ${type.name}: URL', printMode: printMode);
        Logger.log(response.statusCode.toString(), name: 'API TEST ${type.name}: Response Code', printMode: printMode);
        if (response.data != null) {
          Logger.log(response.data.toString(), name: 'API TEST $type: Response Body', printMode: printMode);
        }
      }

      return response;
    } on DioError catch (error) {
      if (testMode) {
        if (error.response != null) {
          Logger.log(error.response!.realUri.toString(), name: 'API TEST ${type.name}: URL', printMode: printMode);
          Logger.log(error.response!.statusCode.toString(), name: 'API TEST ${type.name}: Response Code', printMode: printMode);
          if (error.response!.data != null) {
            Logger.log(error.response!.data.toString(), name: 'API TEST ${type.name}: Response Body', printMode: printMode);
          }
        }
      }
      rethrow;
    }
  }
}
