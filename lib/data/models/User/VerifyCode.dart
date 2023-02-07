class VerifyCode {
  final String id;
  final String userId;
  final String? codeFor;
  final String? code;
  final DateTime creationDate;
  final bool isVerify;
  final int tryCount;
  final int verifyCodeTypeId;

  VerifyCode({
    required this.id,
    required this.userId,
    required this.codeFor,
    required this.code,
    required this.creationDate,
    required this.isVerify,
    required this.tryCount,
    required this.verifyCodeTypeId,
  });
}
