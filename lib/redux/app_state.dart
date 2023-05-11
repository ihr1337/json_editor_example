import '../dio/dio.dart';
import '../models/post_model.dart';

class AppState {
  List<Post> posts;
  bool isLoading;

  AppState({required this.posts, required this.isLoading});

  AppState.initialState()
      : posts = DioClient().list,
        isLoading = false;

  AppState copyWith({List<Post>? posts, bool? isLoading}) {
    return AppState(
      posts: posts ?? this.posts,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
