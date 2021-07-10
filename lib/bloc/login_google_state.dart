part of 'login_google_bloc.dart';

abstract class LoginGoogleState extends Equatable {
  const LoginGoogleState();
}

class LoginGoogleInitial extends LoginGoogleState {
  @override
  List<Object> get props => [];
}

class LoginGoogleLoading extends LoginGoogleState {
  @override
  List<Object> get props => [];
}

class LoginGoogleSuccess extends LoginGoogleState {
  @override
  List<Object> get props => [];
}


class LoginGoogleResult extends LoginGoogleState {
  // final User result;
  //
  // LoginGoogleResult({required this.result});
  @override
  List<Object> get props => [];
}

// class LogOutGoogle extends LoginGoogleState {
//   final String logout;
//
//   LogOutGoogle({required this.logout});
//   @override
//   List<Object> get props => [logout];
// }

class LoginGoogleError extends LoginGoogleState {
  final String error;

  LoginGoogleError({required this.error});
  @override
  List<Object> get props => [error];
}
