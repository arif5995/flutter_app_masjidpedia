import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'data_task_event.dart';
part 'data_task_state.dart';

class DataTaskBloc extends Bloc<DataTaskEvent, DataTaskState> {
  DataTaskBloc() : super(DataTaskInitial());

  @override
  Stream<DataTaskState> mapEventToState(
    DataTaskEvent event,
  ) async* {
      if (event is DataTaskLoading) {

      }

      if (event is DataTaskUser) {
          yield DataLoading();
          // await Future<void>.delayed(Duration(seconds: 1));
            if (event.uid != ''){
                yield DataTaskLoad(load: 'Berhasil ' + event.uid);
            } else {

              yield DataTaskFailure(error: 'Error');
            }
      } else {
          yield DataTaskFailure(error: 'Error');
      }
  }
}
