part of 'home_bloc.dart';

enum HomeStatus { initial, validationInProgress, validationSuccess, validationFailure }

final class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.carsModel,
  });
  final CarsModel? carsModel;

  final HomeStatus status;

  @override
  List<Object> get props => [status];

  HomeState copyWith({
    HomeStatus? status,
    CarsModel? carsModel,
  }) {
    return HomeState(
      status: status ?? this.status,
      carsModel: carsModel ?? this.carsModel,
    );
  }
}
