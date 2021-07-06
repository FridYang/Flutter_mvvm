import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaboshi_flutter_project/http/api_client.dart';
import 'package:kaboshi_flutter_project/view_model/hom_view_model.dart';

final moviewServiceProvider = Provider<HomeViewModel>((ref) {

  return HomeViewModel( ApiClient());
});
