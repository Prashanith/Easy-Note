part of 'sign_in_bloc.dart';

@freezed
abstract class SignInState with _$SignInState {
  const factory SignInState({
    EmailAddress email,
    Password password,
    bool isSubmitting,
    bool showErrorMsgs,
    Option<Either<AuthFailure,Unit>> successOption
  }) = _SignInState;

  factory SignInState.init() => SignInState(
    email: EmailAddress(""),
    password: Password(""),
    isSubmitting: false,
    showErrorMsgs: false,
    successOption: none()
  );
}