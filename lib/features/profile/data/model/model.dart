class ProfileModel {
  final String? fullName;
  final String email;
  final String? phone;
  final String? telegramUsername;

  ProfileModel({
    this.fullName,
    required this.email,
    this.phone,
    this.telegramUsername,
  });

  ProfileModel copyWith({
    String? image,
    String? fullName,
    String? email,
    String? phone,
    String? telegramUsername,
  }) =>
      ProfileModel(
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        telegramUsername: telegramUsername ?? this.telegramUsername,
      );

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        fullName: json["full_name"],
        email: json["email"],
        phone: json["phone"],
        telegramUsername: json["telegram_username"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "phone": phone,
        "telegram_username": telegramUsername,
      };
}
