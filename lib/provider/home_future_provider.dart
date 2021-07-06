
import 'package:hooks_riverpod/all.dart';
import 'package:kaboshi_flutter_project/provider/home_service_provider.dart';
import 'package:kaboshi_flutter_project/test/model/movie.dart';

final homeViewModelFutureProvider = FutureProvider.autoDispose<List<String>>((ref) async {
  //这个参数默认为false。如果用户离开页面并且请求失败，下次则将再次执行该请求。
  // 但是，如果请求成功完成（maintainState为true），则将保留状态，下次重新进入页面时不会触发新的请求。
  ref.maintainState = true;
  final movieService = ref.watch(moviewServiceProvider);
  final movies = await movieService.getMovies();
  return movies;
});