// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

class AuthenticationState {
  final AuthModel? doubleUser;
  final AuthEntity? user;
  final AuthStatus authStatus;
  final MainStatus mainStatus;
  final bool confirmationCode;
  final bool isError;

  AuthenticationState({
    this.user,
    required this.authStatus,
    required this.mainStatus,
    this.doubleUser,
    required this.confirmationCode,
    required this.isError,
  });

  AuthenticationState copyWith({
    AuthModel? doubleUser,
    AuthEntity? user,
    AuthStatus? authStatus,
    MainStatus? mainStatus,
    bool? confirmationCode,
    bool? isError,
  }) {
    return AuthenticationState(
      doubleUser: doubleUser ?? this.doubleUser,
      user: user ?? this.user,
      authStatus: authStatus ?? this.authStatus,
      mainStatus: mainStatus ?? this.mainStatus,
      confirmationCode: confirmationCode ?? this.confirmationCode,
      isError: isError ?? this.isError,
    );
  }

  @override
  bool operator ==(covariant AuthenticationState other) {
    if (identical(this, other)) return true;

    return other.doubleUser == doubleUser &&
        other.user == user &&
        other.authStatus == authStatus &&
        other.mainStatus == mainStatus &&
        other.confirmationCode == confirmationCode &&
        other.isError == isError;
  }

  @override
  int get hashCode {
    return doubleUser.hashCode ^
        user.hashCode ^
        authStatus.hashCode ^
        mainStatus.hashCode ^
        confirmationCode.hashCode ^
        isError.hashCode;
  }
}
