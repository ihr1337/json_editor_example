import '../models/post_model.dart';

class GetPostsAction {
  final List<Post> posts;

  GetPostsAction(this.posts);
}

class SetLoadingAction {
  final bool isLoading;

  SetLoadingAction(this.isLoading);
}
