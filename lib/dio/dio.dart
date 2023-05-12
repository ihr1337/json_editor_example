import 'package:dio/dio.dart';
import 'package:json_editor_example/constants/constants.dart';

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

  Future<void> updateItem(int itemId, String title, String body) async {
    final String url = '$baseUrl/$itemId';
    _dio.put(url, data: {'title': title, 'body': body}).then((response) {
      print('Update Item API Response: $response');
      // Handle the API response
      // ...
    }).catchError((error) {
      print('Update Item API Error: $error');
      // Handle errors
      // ...
    });
  }
}
