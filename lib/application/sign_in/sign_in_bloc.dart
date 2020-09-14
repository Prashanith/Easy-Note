import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_note/domain/auth/failures.dart';
import 'package:easy_note/domain/auth/firebase_auth.dart';
import 'package:easy_note/domain/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(this.auth) : super(SignInState.init());
  final FirebaseAuthFacade auth;
  @override
  Stream<SignInState> mapEventToState(
    SignInEvent event,
  ) async* {
    yield* event.map(emailChanged: (e)async*{
      yield state.copyWith(
        email:EmailAddress(e.emailStr),
        successOption:none()
      );
    }, passwordChanged: (e)async*{

      yield state.copyWith(
          password: Password(e.passwordStr),
          successOption: none(),
        );

    }, registerWithEmailAndPasswordPressed: (e)async*{


       Either<AuthFailure, Unit> failureOrSuccess;

    final isEmailValid = state.email.isValid();
    final isPasswordValid = state.password.isValid();

    if (isEmailValid && isPasswordValid) {
      yield state.copyWith(
        isSubmitting: true,
        successOption: none(),
      );

      failureOrSuccess = await auth.registerWithEmailAndPassword(
        emailAddress: state.email,
        password: state.password,
      );
    }

    yield state.copyWith(
      isSubmitting: false,
      showErrorMsgs: true,
      successOption: optionOf(failureOrSuccess),
    );
  
  

    }, signInWithEmailAndPasswordPressed: (e)async*{

       Either<AuthFailure, Unit> failureOrSuccess;

    final isEmailValid = state.email.isValid();
    final isPasswordValid = state.password.isValid();

    if (isEmailValid && isPasswordValid) {
      yield state.copyWith(
        isSubmitting: true,
        successOption: none(),
      );

      failureOrSuccess = await auth.signInWithEmailAndPassword(
        emailAddress: state.email,
        password: state.password,
      );
    }

    yield state.copyWith(
      isSubmitting: false,
      showErrorMsgs: true,
      successOption: optionOf(failureOrSuccess),
    );
  }

    );
  }
}
