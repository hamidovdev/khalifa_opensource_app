// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
// ignore: duplicate_ignore
// ignore: non_constant_identifier_names
class AuthModel {
  final String? password;
  final String? email;
  final String? token;
  final String? username;
  final int? user_id;
  final int? confirm_code;
  final bool? isSuccess;

  AuthModel({
    this.email,
    this.token,
    this.password,
    this.user_id,
    this.username,
    this.confirm_code,
    this.isSuccess,
  });

  factory AuthModel.fromJsonForCreate(Map<String, dynamic> json) {
    return AuthModel(confirm_code: json["confirmation_code"]);
  }
  factory AuthModel.fromJsonForToken(Map<String, dynamic> json) {
    return AuthModel(
        email: json["email"], token: json["token"], user_id: json["user_id"]);
  }
  factory AuthModel.fromJsonForConfirmCode(Map<String, dynamic> json) {
    return AuthModel(isSuccess: json["success"]);
  }

  Map<String, dynamic> toJsonForCreate() => {
        "email": email,
        "password": password,
      };
  Map<String, dynamic> toJsonForConfirmCode() => {
        "email": email,
        "confirm_code": confirm_code,
      };

  Map<String, dynamic> toJsonForToken() => {
        "email": email,
        "password": password,
      };

  @override
  String toString() {
    return 'AuthModel(password: $password, email: $email, token: $token, username: $username, user_id: $user_id, confirm_code: $confirm_code, isSuccess: $isSuccess)';
  }

  @override
  bool operator ==(covariant AuthModel other) {
    if (identical(this, other)) return true;

    return other.password == password &&
        other.email == email &&
        other.token == token &&
        other.username == username &&
        other.user_id == user_id &&
        other.confirm_code == confirm_code &&
        other.isSuccess == isSuccess;
  }

  @override
  int get hashCode {
    return password.hashCode ^
        email.hashCode ^
        token.hashCode ^
        username.hashCode ^
        user_id.hashCode ^
        confirm_code.hashCode ^
        isSuccess.hashCode;
  }
}
