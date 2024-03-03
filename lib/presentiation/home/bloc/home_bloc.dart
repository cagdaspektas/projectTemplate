import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/car_model.dart';
import '../../../data/services/car_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.carService}) : super(const HomeState()) {
    on<HomeInitial>(_onReset);
  }

  CarService carService;
  CarsModel? carsModel;

  Future<void> _onReset(HomeInitial event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.validationInProgress));
    CarsModel? response = await carService.getCars();
    if (carService.repositoryManager?.response?.statusCode != 200) {
      carsModel = response;
      emit(state.copyWith(status: HomeStatus.validationSuccess, carsModel: response));
    } else {
      emit(state.copyWith(status: HomeStatus.validationFailure, carsModel: null));
    }
  }
}
