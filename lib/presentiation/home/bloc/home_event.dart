part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class HomeCompleted extends HomeEvent {
  const HomeCompleted({required this.carsModel});
  final CarsModel carsModel;

  @override
  List<Object> get props => [carsModel];
}

final class HomeInitial extends HomeEvent {
  const HomeInitial();

  @override
  List<Object> get props => [];
}
