class ProfileView {
  final String id;
  final int hours;
  final String? phone;
  final String? email;

  ProfileView({
    required this.id,
    required this.hours,
    required this.phone,
    required this.email,
  });

  ProfileView.formMap(Map<String, dynamic> map)
      : id = map['id'],
        hours = map['hours'],
        phone = map['phone'],
        email = map['email'];
}
