import 'package:get_charge/data/models/User/BankCard.dart';
import 'package:get_charge/domain/entities/order_entity.dart';

class UserEntity {
  final int id;
  final String? userName;
  final String? normalizedUserName;
  final String? email;
  final String? normalizedEmail;
  final bool emailConfirmed;
  final String passwordHash;
  final String? securityStamp;
  final String? concurrencyStamp;
  final String? phoneNumber;
  final bool phoneNumberConfirmed;
  final bool twoFactorEnabled;
  final DateTime? lockoutEnd;
  final bool lockoutEnabled;
  final int accessFailedCount;
  final DateTime registrationDate;
  final String? promoCode;
  final int bonus;
  final bool isBlocked;
  final String? referralUserId;
  final List<String> referralUser;
  final List<UserClaimEntity>? userClaims;
  final List<BankCard>? bankCards;
  final List<dynamic>? inverseReferralUser;
  final List<OrderDetailEntity>? orders;
  final List<VerifyCodeEntity>? verifyCodes;

  UserEntity({
    required this.id,
    required this.userName,
    required this.normalizedUserName,
    required this.email,
    required this.normalizedEmail,
    required this.emailConfirmed,
    required this.passwordHash,
    required this.securityStamp,
    required this.concurrencyStamp,
    required this.phoneNumber,
    required this.phoneNumberConfirmed,
    required this.twoFactorEnabled,
    required this.lockoutEnd,
    required this.lockoutEnabled,
    required this.accessFailedCount,
    required this.registrationDate,
    required this.promoCode,
    required this.bonus,
    required this.isBlocked,
    required this.referralUserId,
    required this.referralUser,
    required this.userClaims,
    required this.bankCards,
    required this.inverseReferralUser,
    required this.orders,
    required this.verifyCodes,
  });

}

class UserClaimEntity{
  final int id;
  final String userId;
  final String? claimType;
  final String? claimValue;

  UserClaimEntity(this.id, this.userId, this.claimType, this.claimValue);
}

class VerifyCodeEntity {
  final String id;
  final String userId;
  final String? codeFor;
  final String? code;
  final DateTime creationDate;
  final bool isVerify;
  final int tryCount;
  final int verifyCodeTypeId;

  VerifyCodeEntity({
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