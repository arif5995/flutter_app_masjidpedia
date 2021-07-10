import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterappmasjidpedia/Services/service.dart';
import 'package:flutterappmasjidpedia/bloc/authtenticate_bloc.dart';

part 'login_google_event.dart';
part 'login_google_state.dart';

class LoginGoogleBloc extends Bloc<LoginGoogleEvent, LoginGoogleState> {
  LoginGoogleBloc({required this.userRepository, required this.authtenticateBloc}) : super(LoginGoogleInitial());
  final UserRepository userRepository;
  final AuthtenticateBloc authtenticateBloc;
  @override
  Stream<LoginGoogleState> mapEventToState(
    LoginGoogleEvent event,
  ) async* {
    if (event is LoginLoaded) {
      yield LoginGoogleLoading();
      try{
        var akkun = await userRepository.signInWithGoogle();
        if (akkun != null){
          authtenticateBloc.add(Authkredential(user: akkun));
          yield LoginGoogleSuccess();
          yield LoginGoogleInitial();
          // yield LoginGoogleResult();
          // authtenticateBloc.add(Authkredential(user: akkun!));
        } else {
          yield LoginGoogleError(error: 'Erro di loginBloc');
        }

      }catch (e) {
        yield LoginGoogleError(error: e.toString());
      }

    }

    // if (event is SignOutLoaded){
    //     var logout = await userRepository.signOut();
    //     print("logout $logout");
    //     yield LogOutGoogle(logout: logout);
    // }
  }
}
