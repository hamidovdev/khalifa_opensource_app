// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class GetUserInfoEvent extends ProfileEvent {}

class UpdateUserInfoEvent extends ProfileEvent {
  final ProfileModel user;
  final VoidCallback success;
  final VoidCallback failure;
  UpdateUserInfoEvent({
    required this.user,
    required this.success,
    required this.failure,
  });
}

class EditiProfileImage extends ProfileEvent {}
