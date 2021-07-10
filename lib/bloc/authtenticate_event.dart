part of 'authtenticate_bloc.dart';

abstract class AuthtenticateEvent extends Equatable {
  const AuthtenticateEvent();
}

class AuthEventAppStarted extends AuthtenticateEvent {
  @override
  List<Object?> get props => [];

}

class Authkredential extends AuthtenticateEvent{
  final User user;

  Authkredential({required this.user});
  @override
  List<Object?> get props => [user];

}

class SignOutLoaded extends AuthtenticateEvent {
  @override
  List<Object?> get props => [];

}