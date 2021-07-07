// the test.provider will return list of movies
// 1. movieService: Get an instance
// 2. Access to the method which will return
import 'package:hooks_riverpod/all.dart';
import 'package:kaboshi_flutter_project/test/model/movie.dart';


import 'movie_service_provider.dart';
//第三步 创建数据状态监听的Provider
final homeViewModelFutureProvider = FutureProvider.autoDispose<List<Movie>>((ref) async {
  //这个参数默认为false。如果用户离开页面并且请求失败，下次则将再次执行该请求。
  // 但是，如果请求成功完成（maintainState为true），则将保留状态，下次重新进入页面时不会触发新的请求。
  ref.maintainState = true;
  //获取ViewModel 即数据接口代理类
  final movieService = ref.watch(moviewServiceProvider);
  //调用网络请求接口
  final movies = await movieService.getMovies();
  //返回网络数据
  return movies;
});
