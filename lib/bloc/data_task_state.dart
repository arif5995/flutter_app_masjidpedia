part of 'data_task_bloc.dart';

abstract class DataTaskState extends Equatable {
  const DataTaskState();
}

class DataTaskInitial extends DataTaskState {
  @override
  List<Object> get props => [];
}

class DataLoading extends DataTaskState {
  @override
  List<Object?> get props => [];

}

class DataTaskLoad extends DataTaskState {
  final String load;

  DataTaskLoad({required this.load});
  @override
  List<Object?> get props => [load];

}

class DataTaskFailure extends DataTaskState {
  final String error;

  DataTaskFailure({required this.error});
  @override
  List<Object?> get props => [error];

}
