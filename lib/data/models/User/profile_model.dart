import 'package:get_charge/domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {

  ProfileModel({
    required super.id,
    required super.hours,
    required super.phone,
    required super.email,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    id: json['id'] ?? '',
    hours: json['expires_in']?.toInt() ?? 0,
    phone: json['phone'] ?? '',
    email: json['email'] ?? '',
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'hours': hours,
    'phone': phone,
    'email': email,
  };

  @override
  String toString() {
    return 'ProfileModal{${toJson()}';
  }
}
