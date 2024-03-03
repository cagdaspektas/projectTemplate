import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_template/data/services/car_service.dart';

import '../../../core/di/dependency_injection.dart';
import '../bloc/home_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        carService: di<CarService>(),
      )..add(const HomeInitial()),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    final bloc = di<HomeBloc>();

    return BlocSelector<HomeBloc, HomeState, HomeStatus>(
        selector: (state) => state.status,
        builder: (context, status) {
          switch (status) {
            case HomeStatus.initial:
              //  bloc.add(FetchData());
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.red,
              ));
            case HomeStatus.validationInProgress:
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.red,
              ));

            case HomeStatus.validationSuccess:
              return Center(
                child: Text(
                  bloc.carsModel?.cars?[0].id.toString() ?? "",
                ),
              );
            default:
              return const Text("veri yok");
          }
        });
  }
}
