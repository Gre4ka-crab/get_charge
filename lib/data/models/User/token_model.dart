import 'package:get_charge/domain/entities/token_entity.dart';

class TokenModel extends TokenEmpty {

  TokenModel({
    required super.accessToken,
    required super.expiresIn,
    required super.tokenType,
    required super.scope,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
        accessToken: json['access_token'] ?? '',
        expiresIn: Duration(seconds: (json['expires_in']?.toInt()) ?? 0),
        tokenType: json['token_type'] ?? '',
        scope: json['scope'] ?? '',
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'access_token': accessToken,
    'expires_in': expiresIn.inSeconds,
    'token_type': tokenType,
    'scope': scope,
  };

  List<Object> get props => [accessToken];

  @override
  String toString() {
    return 'TokenModel{${toJson()}';
  }
}
