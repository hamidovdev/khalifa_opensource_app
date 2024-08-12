import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khalifa/core/status/main_status.dart';
import 'package:khalifa/core/status/page_status.dart';
import 'package:khalifa/core/usecase/usecase.dart';
import 'package:khalifa/features/profile/data/datasource/datasource.dart';
import 'package:khalifa/features/profile/data/model/model.dart';
import 'package:khalifa/features/profile/data/repository/repository.dart';
import 'package:khalifa/features/profile/domain/usecase/getUserInfoUseCase.dart';
import 'package:khalifa/features/profile/domain/usecase/updateUserInfoUseCase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc()
      : super(ProfileState(
          mainStatus: MainStatus.notfound,
          pageStatus: PageStatus.success,
        )) {
    on<GetUserInfoEvent>((event, emit) async {
      emit(
        state.copyWith(
          mainStatus: MainStatus.loading,
        ),
      );
      final usecase = GetUserInfoUseCase(
        repository: ProfileRepositoryImpl(
          dataSource: ProfileDataSource(),
        ),
      );
      final either = await usecase.call(NoParams());
      either.either((failure) {
        emit(
          state.copyWith(
            mainStatus: MainStatus.failure,
          ),
        );
      }, (value) {
        emit(
          state.copyWith(
            mainStatus: MainStatus.success,
            user: value,
          ),
        );
      });
    });
    on<UpdateUserInfoEvent>((event, emit) async {
      final usecase = UpdateUserInfoUseCase(
        repository: ProfileRepositoryImpl(
          dataSource: ProfileDataSource(),
        ),
        user: event.user,
      );
      final either = await usecase.call(NoParams());
      either.either((failure) {
        emit(
          state.copyWith(
            pageStatus: PageStatus.failure,
          ),
        );
        event.failure();
      }, (value) {
        emit(
          state.copyWith(
            pageStatus: PageStatus.success,
            mainStatus: MainStatus.notfound,
          ),
        );
        event.success();
      });
    });

    on<EditiProfileImage>((event, emit) async {
      ImagePicker imagePicker = ImagePicker();

      final file = await imagePicker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        print("If ga keldi");
        emit(
          state.copyWith(
            imgPath: file.path,
          ),
        );
        print("State qiymati ${state.profileimg}");
      }
    });
  }
}
