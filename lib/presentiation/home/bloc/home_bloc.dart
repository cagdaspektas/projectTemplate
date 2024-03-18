import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/car_model.dart';
import '../../../data/services/car_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.carService}) : super(const HomeState()) {
    on<HomeInitial>(_onInitial);
  }

  final CarService carService;
  CarsModel? carsModel;

  Future<void> _onInitial(HomeInitial event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.validationInProgress));
    carsModel = await carService.getCars();
    if (carService.repositoryManager?.response?.statusCode == 200) {
      emit(state.copyWith(status: HomeStatus.validationSuccess, carsModel: carsModel));
    } else {
      emit(state.copyWith(status: HomeStatus.validationFailure, carsModel: null));
    }
  }
}
