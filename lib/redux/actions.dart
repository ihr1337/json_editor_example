// ignore_for_file: avoid_print

import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../dio/dio.dart';
import '../models/post_model.dart';
import 'app_state.dart';

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

ThunkAction<AppState> editItemThunk(
    int itemId, String newTitle, String newBody) {
  return (Store<AppState> store) async {
    try {
      await DioClient().updateItem(itemId, newTitle, newBody);

      store.dispatch(EditItemAction(itemId, newTitle, newBody));
    } catch (error) {
      print(error);
    }
  };
}
