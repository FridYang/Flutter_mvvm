
import 'package:dio/dio.dart';



import 'package:retrofit/retrofit.dart';

import 'BaseDio.dart';

part 'api_client.g.dart';
//命令行自动生成 api_client.g.dart 中的方法
// Step 1: flutter pub upgrade
// Step 2: flutter pub run build_runner build
@RestApi(baseUrl: 'https://api.lishaoy.net')
abstract class ApiClient {
  factory ApiClient({Dio dio, String baseUrl}) {
    dio ??= BaseDio.getInstance().getDio();
    return _ApiClient(dio, baseUrl: baseUrl);
  }



  /**
   * 获取首页推荐文章
   */
  @GET('/posts')
  Future<Object> getPosts(
      @Query('pageIndex') String pageIndex, @Query('pageSize') String pageSize,);
  //
  //
  // /**
  //  * 登录
  //  */
  // @POST('/login')
  // Future<LoginModel> login(@Body() Login login);
  //
  // /**
  //  * 点赞
  //  */
  // @POST('/posts/{postId}/like')
  // Future<BaseModel> like(@Path('postId') int postId);
  //
  // /**
  //  * 获取分类
  //  */
  // @GET('/category')
  // Future<CategoryModel> getCategory();


}
