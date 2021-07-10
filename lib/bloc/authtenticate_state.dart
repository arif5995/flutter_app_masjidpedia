part of 'authtenticate_bloc.dart';

abstract class AuthtenticateState extends Equatable {
  const AuthtenticateState();
}

class AuthtenticateInitial extends AuthtenticateState {
  @override
  List<Object> get props => [];
}

class AuthtenticateLoaded extends AuthtenticateState {
  final User user;

  AuthtenticateLoaded({required this.user});
  @override
  List<Object> get props => [user];
}

class AuthtenticateNotLoaded extends AuthtenticateState {
  // final bool auth;
  //
  // AuthtenticateLoaded({required this.auth});
  @override
  List<Object> get props => [];
}

class AuthtenticateFailure extends AuthtenticateState {
  final String error;

  AuthtenticateFailure({required this.error});
  @override
  List<Object> get props => [error];
}

class LogOutGoogle extends AuthtenticateState {
  final String logout;

  LogOutGoogle({required this.logout});
  @override
  List<Object> get props => [logout];
}