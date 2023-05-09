import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../constants/constants.dart';
import '../dio/dio.dart';
import '../models/post_model.dart';
import '../redux/actions.dart';
import '../redux/app_state.dart';
import '../redux/store.dart';

class ItemsList extends StatefulWidget {
  const ItemsList({super.key});

  @override
  State<ItemsList> createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
  @override
  void initState() {
    super.initState();

    store.dispatch(SetLoadingAction(true));

    DioClient()
        .getPosts(baseUrl)
        .then((posts) => store.dispatch(GetPostsAction(posts)))
        .catchError((error) => print(error))
        .whenComplete(() {
      store.dispatch(SetLoadingAction(false));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Posts list'),
        ),
        body: CustomScrollView(scrollDirection: Axis.vertical, slivers: [
          SliverFillRemaining(
              child: Center(
            child: SafeArea(
              child: SizedBox(
                height: double.infinity,
                child: StoreConnector<AppState, List<Post>>(
                  converter: (store) => store.state.posts,
                  builder: (context, snapshot) {
                    if (store.state.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (store.state.posts.isEmpty) {
                      return const Center(child: Text('Error: No posts found'));
                    } else {
                      return ListView.builder(
                        itemCount: store.state.posts.length,
                        itemBuilder: (context, int index) {
                          Post post = store.state.posts[index];
                          return ListTile(
                            onTap: () => Modular.to.pushNamed(
                              '/list/item',
                              arguments: post.id,
                            ),
                            title: Text(post.title),
                            subtitle: Text(post.body),
                            leading: Text("${post.id}"),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          )),
        ]));
  }
}
