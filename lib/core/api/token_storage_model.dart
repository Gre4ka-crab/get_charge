class TokenStorageModel {
  final String token;
  final DateTime? tokenExpireDateTime;
  final String refreshToken;

  TokenStorageModel({
    required this.token,
    this.tokenExpireDateTime,
    required this.refreshToken,
  });

  factory TokenStorageModel.fromJson(Map<String, dynamic> json) => TokenStorageModel(
    token: json['token'] ?? '',
    tokenExpireDateTime: DateTime.parse(json['tokenExpireDateTime']),
    refreshToken: json['refreshToken'] ?? '',
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'token': token,
    'tokenExpireDateTime': tokenExpireDateTime?.toIso8601String(),
    'refreshToken': refreshToken,
  };

  List<Object> get props => [token, refreshToken];

  @override
  String toString() {
    return 'TokenStorageModel{${toJson()}';
  }
}
