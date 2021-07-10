import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterappmasjidpedia/bloc/authtenticate_bloc.dart';
import 'package:flutterappmasjidpedia/bloc/data_task_bloc.dart';

class CobaScreen extends StatelessWidget {
  const CobaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DataTaskBloc()..add(DataTaskUser(uid: 'yubjkjbjb')),
      child: Scaffold(
        body: Column(
          children: [
            BlocBuilder<AuthtenticateBloc, AuthtenticateState>(
                builder: (context, state) {
                if (state is AuthtenticateLoaded) {
                  return Text(state.user.displayName ?? '');
                }
                return Center(child: Text('dATA nOLL'),);
            }),
            BlocBuilder<DataTaskBloc, DataTaskState>(
              builder: (context, state) {
                if ( state is DataTaskLoad) {
                  return Container(
                    child: Center(child: Text(state.load)),
                  );
                }
                return Center(child: Text('Data Gak ADa'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
