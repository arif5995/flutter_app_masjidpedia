import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterappmasjidpedia/Services/service.dart';
import 'package:flutterappmasjidpedia/bloc/authtenticate_bloc.dart';
import 'package:flutterappmasjidpedia/bloc/login_google_bloc.dart';
import 'package:flutterappmasjidpedia/bloc/login_google_bloc.dart';
import 'package:flutterappmasjidpedia/pages/home_screen.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AuthtenticateBloc, AuthtenticateState>(
          builder: (context, state) {
            final authbloc = BlocProvider.of<AuthtenticateBloc>(context);
            if (state is AuthtenticateNotLoaded) {
              return _AuthForm();
            }
            if (state is AuthtenticateFailure) {
              // show error
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(state.error),
                    FlatButton(
                        onPressed: (){
                          authbloc.add(AuthEventAppStarted());
                        },
                        child: Text('Retry')
                    )
                  ],
                ),
              );
            }
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _AuthForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authservice = UserRepository();
    final authBloc1 = BlocProvider.of<AuthtenticateBloc>(context);

    return Container(
      alignment: Alignment.center,
      child: BlocProvider<LoginGoogleBloc>(
        create: (context) =>
            LoginGoogleBloc(
                userRepository: authservice,
                authtenticateBloc: authBloc1),
        child: BlocConsumer<LoginGoogleBloc, LoginGoogleState>(
          listener: (context, state) {
            if (state is LoginGoogleError){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('${state.error}'),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 1),
              ));
            }
          },
          builder: (context, state) {
            if (state is LoginGoogleSuccess){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              child: Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: InkWell(
                    onTap: () {
                      context.read<LoginGoogleBloc>().add(LoginLoaded());
                      // _handleSignIn();
                      //
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            "assets/images/google.png", width: 30, height: 30,),
                          Text("Sign In with google")
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
