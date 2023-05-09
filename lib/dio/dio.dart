import 'package:dio/dio.dart';

import '../models/post_model.dart';

class DioClient {
  final Dio _dio = Dio();

  List<Post> list = [];

  Future<List<Post>> getPosts(String baseUrl) async {
    Response getList = await _dio.get(baseUrl);

    for (var item in getList.data) {
      Post post = Post.fromJson(item);
      list.add(post);
    }
    return list;
  }
}
