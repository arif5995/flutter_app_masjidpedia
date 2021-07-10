part of 'login_google_bloc.dart';

abstract class LoginGoogleEvent extends Equatable {
  const LoginGoogleEvent();
}

class LoginLoaded extends LoginGoogleEvent {
  @override
  List<Object?> get props => [];

}

// class SignOutLoaded extends LoginGoogleEvent {
//   @override
//   List<Object?> get props => [];
//
// }