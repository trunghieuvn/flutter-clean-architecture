part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class LoadDataStoreSuccess extends HomeState {
  final DataStoreModel dataStoreModel;

  LoadDataStoreSuccess(this.dataStoreModel);
}

class LoadDataStoreError extends HomeState {
  final String msg;

  LoadDataStoreError(this.msg);
}
