import 'package:json_editor_example/redux/app_state.dart';

import 'actions.dart';

AppState reducer(AppState state, dynamic action) {
  if (action is GetPostsAction) {
    return AppState(posts: action.posts, isLoading: false);
  } else if (action is SetLoadingAction) {
    return AppState(posts: state.posts, isLoading: action.isLoading);
  }

  return state;
}
