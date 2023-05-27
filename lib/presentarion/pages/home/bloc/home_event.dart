part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

final class OnFetchData extends HomeEvent {}

final class OnSearchData extends HomeEvent {
  const OnSearchData({required this.query});

  final String query;

  @override
  List<Object> get props => [query];
}
