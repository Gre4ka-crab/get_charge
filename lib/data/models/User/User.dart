import 'package:get_charge/data/models/User/BankCard.dart';
import 'package:get_charge/data/models/User/Order.dart';
import 'package:get_charge/data/models/User/UserClaim.dart';
import 'package:get_charge/data/models/User/VerifyCode.dart';

class User {
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
  final List<UserClaim>? userClaims;
  final List<BankCard>? bankCards;
  final List<dynamic>? inverseReferralUser;
  final List<Order>? orders;
  final List<VerifyCode>? verifyCodes;

  User({
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
