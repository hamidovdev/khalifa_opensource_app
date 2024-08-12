part of 'home_bloc.dart';

abstract class HomeEvent {}

class ChangeActiveIndex extends HomeEvent {
  final int index;

  ChangeActiveIndex({required this.index});
}
