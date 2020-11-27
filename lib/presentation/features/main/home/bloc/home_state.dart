part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class LoadDataStoreSuccess extends HomeState {
  final List<RecordEntity> records;
  LoadDataStoreSuccess(this.records);
}

class LoadDataStoreError extends HomeState {
  final String msg;

  LoadDataStoreError(this.msg);
}
