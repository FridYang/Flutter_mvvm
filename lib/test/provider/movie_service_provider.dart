import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kaboshi_flutter_project/test/ui/home/home_viewmodel.dart';

import 'config_provider.dart';

final moviewServiceProvider = Provider<HomeViewModel>((ref) {
  final config = ref.watch(environmentConfigProvider);
  return HomeViewModel(config, Dio());
});
