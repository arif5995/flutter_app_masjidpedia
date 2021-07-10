import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterappmasjidpedia/Services/service.dart';
import 'package:flutterappmasjidpedia/bloc/authtenticate_bloc.dart';
import 'package:flutterappmasjidpedia/bloc/data_task_bloc.dart';
import 'package:flutterappmasjidpedia/bloc/login_google_bloc.dart';
import 'package:flutterappmasjidpedia/pages/coba_page.dart';
import 'package:flutterappmasjidpedia/pages/home_screen.dart';
import 'package:flutterappmasjidpedia/pages/login_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      GetMaterialApp(
          home: BlocProvider(
            create: (context) =>
                AuthtenticateBloc(
                    userRepository: UserRepository(),
                    // dataTaskBloc: DataTaskBloc()
                )..add(AuthEventAppStarted()),
            child: MyApp(),
          )
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// The future is part of the state of our widget. We should not call `initializeApp`
    /// directly inside [build].
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
            future: _initialization,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Container(
                    color: Colors.white,
                    child: Center(child: Text("Error Unknown!"),));
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return BlocBuilder<AuthtenticateBloc, AuthtenticateState>(
                  builder: (context, state) {
                    if (state is AuthtenticateLoaded) {
                      return HomeScreen();
                    }

                      return LoginScreen();
                  },
                );
              }
              return Container(
                  color: Colors.white,
                  child: Center(child: CircularProgressIndicator(),));
            })
    );
  }
}

