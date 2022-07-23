import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fooderlich_app/api/api.dart';
import 'package:fooderlich_app/api/models/models.dart';

part 'explore_data_event.dart';
part 'explore_data_state.dart';

class ExploreDataBloc extends Bloc<ExploreDataEvent, ExploreDataState> {
  ExploreDataBloc({required FooderlichService service})
      : _fooderlichService = service,
        super(const ExploreDataInitial()) {
    on<LoadExploreData>(_onLoadExploreData);
  }

  final FooderlichService _fooderlichService;

  Future<void> _onLoadExploreData(LoadExploreData event, Emitter<ExploreDataState> emit) async {
    emit(const ExploreDataLoading());
    try {
      final exploreData = await _fooderlichService.getExploreData();
      emit(ExploreDataLoaded(recipes: exploreData.todayRecipes, posts: exploreData.friendPosts));
    } catch (e) {
      //TODO: Implement proper error handling
      emit(ExploreDataError(e.toString()));
    }
  }
}
