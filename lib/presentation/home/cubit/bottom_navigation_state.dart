part of 'bottom_navigation_cubit.dart';

@immutable
class BottomNavigationState extends Equatable {
  final int index;

  const BottomNavigationState([this.index = 0]);

  @override
  List<Object> get props => [index];
}
