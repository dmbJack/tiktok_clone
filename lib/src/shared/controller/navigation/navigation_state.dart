part of 'navigation_cubit.dart';

sealed class NavigationState extends Equatable {
  final int index;
  const NavigationState({this.index = 0});

  @override
  List<Object> get props => [index];
}

final class NavigationInitial extends NavigationState {}

final class OnNavigationChanged extends NavigationState {
  const OnNavigationChanged({required int index}) : super(index: index);
}
