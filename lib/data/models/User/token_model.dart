import 'package:get_charge/domain/entities/token_entity.dart';

class TokenModel extends TokenEmpty {

  TokenModel({
    required super.token,
    super.tokenExpireDateTime,
    required super.refreshToken,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
    token: json['token'] ?? '',
    tokenExpireDateTime: DateTime.parse(json['tokenExpireDateTime']),
    refreshToken: json['refreshToken'] ?? '',
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'token': token,
    'tokenExpireDateTime': tokenExpireDateTime?.toIso8601String(),
    'refreshToken': refreshToken,
  };

  List<Object> get props => [token];

  @override
  String toString() {
    return 'TokenModel{${toJson()}';
  }
}

