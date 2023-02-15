import 'package:get_charge/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.userName,
    required super.normalizedUserName,
    required super.email,
    required super.normalizedEmail,
    required super.emailConfirmed,
    required super.passwordHash,
    required super.securityStamp,
    required super.concurrencyStamp,
    required super.phoneNumber,
    required super.phoneNumberConfirmed,
    required super.twoFactorEnabled,
    required super.lockoutEnd,
    required super.lockoutEnabled,
    required super.accessFailedCount,
    required super.registrationDate,
    required super.promoCode,
    required super.bonus,
    required super.isBlocked,
    required super.referralUserId,
    required super.referralUser,
    required super.userClaims,
    required super.bankCards,
    required super.inverseReferralUser,
    required super.orders,
    required super.verifyCodes,
  });
}

class VerifyCodeModel extends VerifyCodeEntity {
  VerifyCodeModel({
    required super.id,
    required super.userId,
    required super.codeFor,
    required super.code,
    required super.creationDate,
    required super.isVerify,
    required super.tryCount,
    required super.verifyCodeTypeId,
  });
}

class UserClaimModel extends UserClaimEntity{
  UserClaimModel(super.id, super.userId, super.claimType, super.claimValue);
}