part of 'data_task_bloc.dart';

abstract class DataTaskEvent extends Equatable {
  const DataTaskEvent();
}

class DataTaskLoading extends DataTaskEvent {
  @override
  List<Object?> get props => [];
}

class DataTaskUser extends DataTaskEvent {
  final String uid;

  DataTaskUser({required this.uid});

  @override
  // TODO: implement props
  List<Object?> get props => [uid];
}
