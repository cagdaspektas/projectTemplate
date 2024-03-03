import 'package:dio/dio.dart';
import 'package:flutter_bloc_template/data/services/car_service.dart';
import 'package:get_it/get_it.dart';

import '../../presentiation/home/bloc/home_bloc.dart';
import '../network/network_manager.dart';
import '../repository/repository_manager.dart';

final di = GetIt.instance;

Future<void> setupDi() async {
  //Network - Service
  di.registerLazySingleton<Dio>(() => NetworkManager.instance.dio);
  di.registerLazySingleton<RepositoryManager>(() => RepositoryManager(dio: di<Dio>()));

  //services
  di.registerLazySingleton<CarService>(() => CarService(repositoryManager: di<RepositoryManager>()));

//bloc
  di.registerFactory<HomeBloc>(() => HomeBloc(carService: di<CarService>()));
}
