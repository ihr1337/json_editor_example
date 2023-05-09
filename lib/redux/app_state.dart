import 'package:json_editor_example/dio/dio.dart';
import 'package:json_editor_example/models/post_model.dart';

class AppState {
  List<Post> posts;
  bool isLoading;

  AppState({required this.posts, required this.isLoading});

  AppState.initialState()
      : posts = DioClient().list,
        isLoading = false;
}
