import '../models/post_model.dart';
import 'app_state.dart';
import 'actions.dart';

AppState reducer(AppState state, dynamic action) {
  if (action is EditItemAction) {
    final List<Post> updatedPosts = List.from(state.posts);
    updatedPosts[action.index] = updatedPosts[action.index].copyWith(
      title: action.newTitle,
      body: action.newBody,
    );

    return state.copyWith(posts: updatedPosts);
  } else if (action is GetPostsAction) {
    return state.copyWith(posts: action.posts, isLoading: false);
  } else if (action is SetLoadingAction) {
    return state.copyWith(isLoading: action.isLoading);
  }

  return state;
}
