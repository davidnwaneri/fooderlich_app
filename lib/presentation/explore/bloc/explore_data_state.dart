part of 'explore_data_bloc.dart';

abstract class ExploreDataState extends Equatable {
  const ExploreDataState();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

class ExploreDataInitial extends ExploreDataState {
  const ExploreDataInitial();
}

class ExploreDataLoading extends ExploreDataState {
  const ExploreDataLoading();
}

class ExploreDataLoaded extends ExploreDataState {
  final List<ExploreRecipe> recipes;
  final List<Post> posts;

  const ExploreDataLoaded({
    required this.recipes,
    required this.posts,
  });

  @override
  List<Object> get props => [recipes, posts];
}

class ExploreDataError extends ExploreDataState {
  final String message;

  const ExploreDataError(this.message);

  @override
  List<Object> get props => [message];
}
