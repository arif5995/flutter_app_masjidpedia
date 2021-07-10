import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterappmasjidpedia/Services/service.dart';
import 'package:flutterappmasjidpedia/bloc/data_task_bloc.dart';

part 'authtenticate_event.dart';
part 'authtenticate_state.dart';

class AuthtenticateBloc extends Bloc<AuthtenticateEvent, AuthtenticateState> {
  AuthtenticateBloc({required this.userRepository}) : super(AuthtenticateInitial());
  final UserRepository userRepository;
  // final DataTaskBloc dataTaskBloc = DataTaskBloc();

  @override
  Stream<AuthtenticateState> mapEventToState(
    AuthtenticateEvent event,
  ) async* {
    if (event is AuthEventAppStarted){
        try {
          final currUser = await userRepository.authenticate();
          if (currUser != null) {
            yield AuthtenticateLoaded(user: currUser);
          } else {
            yield AuthtenticateNotLoaded();
          }
        } catch (e) {
          yield AuthtenticateFailure(error: e.toString());
        }
    }

    if (event is Authkredential){
        // final auth = await userRepository.authenticate(event.user.uid);
        if (event.user.uid != ''){
          // dataTaskBloc.add(DataTaskUser(uid: event.user.uid));
          yield AuthtenticateLoaded(user: event.user);
        } else {
          yield AuthtenticateNotLoaded();
        }
    }

    if (event is SignOutLoaded){
        var logout = await userRepository.signOut();
        print("logout $logout");
        yield AuthtenticateNotLoaded();
    }
  }
}
