import 'package:dio/dio.dart';

import '../../core/repository/repository_manager.dart';
import '../models/car_model.dart';

abstract class CarServiceHelper {
  Future<CarsModel?> getCars();
}

class CarService extends CarServiceHelper {
  RepositoryManager? repositoryManager;
  CarService({required this.repositoryManager});

  @override
  Future<CarsModel?> getCars() async {
    try {
      CarsModel? cars = await repositoryManager?.fetch(path: "cars", model: CarsModel());
      if (repositoryManager?.response?.statusCode == 200) {
        return cars;
      }
    } on DioException catch (e) {
      print(e);
    }
    return null;
  }
}
