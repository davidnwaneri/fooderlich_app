import 'package:bloc/bloc.dart';
import 'package:fooderlich_app/fooferlich_logger.dart.dart';

class FooderlichBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    // "onEvent $event added to ${bloc.runtimeType}".log();
    event.log();
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    // "onTransition: $transition on ${bloc.runtimeType}".log();
    // transition.log();
    print(transition);
  }

  // @override
  // void onChange(BlocBase bloc, Change change) {
  //   super.onChange(bloc, change);
  //   // "onChange: $change on ${bloc.runtimeType}".log();
  //   change.log();
  // }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    "onError: $error on $bloc".log();
  }
}
