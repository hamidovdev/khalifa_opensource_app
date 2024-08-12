// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

class HomeState {
  final int activeIndex;

  HomeState({required this.activeIndex});

  HomeState copyWith({
    int? activeIndex,
  }) {
    return HomeState(
      activeIndex: activeIndex ?? this.activeIndex,
    );
  }

  @override
  bool operator ==(covariant HomeState other) {
    if (identical(this, other)) return true;

    return other.activeIndex == activeIndex;
  }

  @override
  int get hashCode => activeIndex.hashCode;
}
