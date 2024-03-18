import 'package:dio/dio.dart';
import 'package:flutter_bloc_template/core/network/server_exception.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../product/widgets/alert_dialog.dart';

class NetworkManager {
  static final NetworkManager _instance = NetworkManager._internal();
  static NetworkManager get instance => _instance;

  late Dio dio;

  NetworkManager._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://myfakeapi.com/api/",
        receiveTimeout: const Duration(seconds: 20), // 20 seconds
        connectTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
      ),
    );

    dio
      ..interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90))
      ..interceptors.add(InterceptorsWrapper(
        onError: (e, handler) {
          showMyDialog(ServerException(e).message);
          return handler.next(e);
        },
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (e, handler) {
          return handler.next(e);
        },
      ));
  }
}
