import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kaboshi_flutter_project/http/api_client.dart';

import '../ui/widgets/exception_view.dart';

class HomeViewModel extends ChangeNotifier {
  final ApiClient api;

  HomeViewModel(this.api);

  Future<List<String>> getMovies() async {
    try {
      final response = await api.getPosts('1','8');
      return response;
    } on DioError catch (dioError) {
      throw ExceptionView.fromDioError(dioError);
    }
  }
}
