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

    return Scaffold(
      body: BlocListener<HomeBloc, HomeState>(
        bloc: bloc,
        listener: (context, state) {},
        child: BlocBuilder<HomeBloc, HomeState>(
          bloc: bloc,
          builder: (context, state) {
            switch (state.status) {
              case HomeStatus.initial:
                bloc.add(const HomeInitial());
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
                    state.carsModel?.cars?[0].car.toString() ?? "",
                    style: const TextStyle(fontSize: 15.0, color: Colors.black),
                    //   bloc.carsModel?.cars?[0].car.toString() ?? "sdasdasd",
                  ),
                );
              case HomeStatus.validationFailure:
                return const SizedBox();
              default:
                return const Text("veri yok");
            }
          },
        ),
      ),
    );
  }
}
