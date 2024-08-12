import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:khalifa/core/status/auth_status.dart';
import 'package:khalifa/core/status/main_status.dart';
import 'package:khalifa/core/usecase/usecase.dart';
import 'package:khalifa/features/authentication/data/datasource/datasource.dart';
import 'package:khalifa/features/authentication/data/model/model.dart';
import 'package:khalifa/features/authentication/data/repository/repositoryImpl.dart';
import 'package:khalifa/features/authentication/domain/entity/entity.dart';
import 'package:khalifa/features/authentication/domain/usecase/confirmCodeUseCase.dart';
import 'package:khalifa/features/authentication/domain/usecase/getTokenUseCase.dart';
import 'package:khalifa/features/authentication/domain/usecase/getUserUseCase.dart';
import 'package:khalifa/features/authentication/domain/usecase/signInUseCase.dart';
import 'package:khalifa/features/authentication/domain/usecase/signUpUseCase.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc()
      : super(
          AuthenticationState(
            authStatus: AuthStatus.notfound,
            mainStatus: MainStatus.success,
            confirmationCode: false,
            isError: false,
          ),
        ) {
    on<ThisUserAuthenticated>((event, emit) {});
    on<SignUpEvent>((event, emit) async {
      emit(state.copyWith(mainStatus: MainStatus.loading));
      final usecase = AuthSignUpUseCase(
        repository: AuthRepositoryImpl(dataSource: AuthDataSource()),
        email: event.email,
        password: event.password,
      );
      final either = await usecase.call(NoParams());
      either.either((failure) {
        print("SignUp eventga keldiiiiiiiiiiiiiiiiii xatooooo");

        event.failure();
        emit(state.copyWith(
          mainStatus: MainStatus.failure,
        ));
      }, (value) {
        print("SignUp eventga keldiiiiiiiiiiiiiiiiii $value");
        emit(state.copyWith(
          doubleUser: AuthModel(
            confirm_code: value.confirm_code,
            email: event.email,
            password: event.password,
          ),
          mainStatus: MainStatus.success,
        ));
        event.success();
      });
    });
    on<ConfirmCodeEvent>((event, emit) async {
      print("Birinchi ********************************* ${event.code}");
      emit(state.copyWith(mainStatus: MainStatus.loading));
      final usecase = AuthConfirmCodeUseCase(
        repository: AuthRepositoryImpl(dataSource: AuthDataSource()),
        email: event.email,
        confirmationCode: event.code,
      );
      final either = await usecase.call(NoParams());
      print("ikkinchi *********************************");

      either.either((failure) {
        emit(state.copyWith(
          isError: true,
          confirmationCode: false,
          mainStatus: MainStatus.failure,
        ));
      }, (value) {
        print("uchinchi ********************************* $value");

        emit(state.copyWith(confirmationCode: true, isError: false));
        event.success();
      });
    });
    on<SignInEvent>((event, emit) async {
      final usecase = AuthSignInUseCase(
        repository: AuthRepositoryImpl(dataSource: AuthDataSource()),
        email: event.email,
        password: event.password,
      );

      final either = await usecase.call(NoParams());
      either.either((failure) {
        emit(state.copyWith(
          mainStatus: MainStatus.failure,
        ));
        event.failure();
      }, (value) {
        emit(state.copyWith(
          user: value,
        ));
        event.success();
      });
    });
    on<GetTokenEvent>((event, emit) async {
      final usecase = AuthGetTokenUseCase(
        repository: AuthRepositoryImpl(dataSource: AuthDataSource()),
        email: event.email,
        password: event.password,
      );

      final either = await usecase.call(NoParams());
      either.either((failure) {
        emit(state.copyWith(
          mainStatus: MainStatus.failure,
        ));
      }, (value) {
        emit(state.copyWith(
          user: value,
        ));
        event.success();
      });
    });
    on<GetUserEvent>((event, emit) async {
      final usecase = GetUserUseCase(
        repository: AuthRepositoryImpl(
          dataSource: AuthDataSource(),
        ),
      );
      final either = await usecase.call(NoParams());
      either.either((failure) {
        emit(
          state.copyWith(
            authStatus: AuthStatus.unAuthentication,
          ),
        );
      }, (value) {
        emit(
          state.copyWith(
            authStatus: value,
          ),
        );
      });
    });
  }
}
