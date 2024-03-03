import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_bloc_template/core/repository/base_model.dart';

class RepositoryManager {
  Dio? dio;
  Response<dynamic>? response;
  RepositoryManager({this.dio});

  Future fetch<T extends BaseModel>({required String path, required T model}) async {
    response = await dio?.get(path);
    if (response?.data is Map) {
      return model.fromJson(json.decode(json.encode(response?.data)));
    } else if (response?.data is List) {
      return List<T>.from(json.decode(json.encode(response?.data)).map((x) => model.fromJson(x)));
    } else {
      return model.fromJson(json.decode(json.encode(response?.data)));
    }
  }

  Future post<T extends BaseModel>(
      {required String path, required T model, Object? data, Map<String, dynamic>? queryParameters}) async {
    response = await dio?.post(path, data: data, queryParameters: queryParameters);
    if (response?.data is Map) {
      return model.fromJson(json.decode(json.encode(response?.data)));
    } else if (response?.data is List) {
      return List<T>.from(json.decode(json.encode(response?.data)).map((x) => model.fromJson(x)));
    } else {
      return model.fromJson(json.decode(json.encode(response?.data)));
    }
  }
}
