import '../models/post_model.dart';

class GetPostsAction {
  final List<Post> posts;

  GetPostsAction(this.posts);
}

class SetLoadingAction {
  final bool isLoading;

  SetLoadingAction(this.isLoading);
}

class EditItemAction {
  final int index;
  final String newTitle;
  final String newBody;

  EditItemAction(this.index, this.newTitle, this.newBody);
}
