// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

class ProfileState {
  final MainStatus mainStatus;
  final PageStatus pageStatus;
  final ProfileModel? user;
  final String? profileimg;

  ProfileState({
    required this.mainStatus,
    required this.pageStatus,
    this.user,
    this.profileimg,
  });

  ProfileState copyWith({
    MainStatus? mainStatus,
    PageStatus? pageStatus,
    ProfileModel? user,
    String? imgPath,
  }) {
    return ProfileState(
      mainStatus: mainStatus ?? this.mainStatus,
      pageStatus: pageStatus ?? this.pageStatus,
      user: user ?? this.user,
      profileimg: imgPath ?? this.profileimg,
    );
  }

  @override
  bool operator ==(covariant ProfileState other) {
    if (identical(this, other)) return true;

    return other.mainStatus == mainStatus &&
        other.pageStatus == pageStatus &&
        other.user == user &&
        other.profileimg == profileimg;
  }

  @override
  int get hashCode {
    return mainStatus.hashCode ^
        pageStatus.hashCode ^
        user.hashCode ^
        profileimg.hashCode;
  }
}
