part of 'explore_data_bloc.dart';

abstract class ExploreDataEvent extends Equatable {
  const ExploreDataEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class LoadExploreData extends ExploreDataEvent {
  const LoadExploreData();
}
