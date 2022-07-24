import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fooderlich_app/api/api.dart';
import 'package:fooderlich_app/fooferlich_logger.dart.dart';

import '../../../api/models/models.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeBloc({required FooderlichService service})
      : _fooderlichService = service,
        super(const RecipeInitial()) {
    on<LoadRecipes>(_onLoadRecipes);
  }
  final FooderlichService _fooderlichService;

  Future<void> _onLoadRecipes(LoadRecipes event, Emitter<RecipeState> emit) async {
    emit(const RecipeLoading());
    await _fooderlichService.getRecipes().then((recipes) {
      emit(RecipeLoaded(recipes: recipes));
    }).catchError((error) {
      emit(RecipeError(message: error.toString()));
    });
  }
}
