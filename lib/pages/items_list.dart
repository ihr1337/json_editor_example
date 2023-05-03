import 'package:flutter/material.dart';

import 'package:json_editor_example/models/post_model.dart';

class ItemsList extends StatefulWidget {
  const ItemsList({super.key});

  @override
  State<ItemsList> createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
  late Future<List<Post>> futureList;

  @override
  void initState() {
    super.initState();

    futureList = getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          getPosts();
        }),
        appBar: AppBar(),
        body: CustomScrollView(scrollDirection: Axis.vertical, slivers: [
          SliverFillRemaining(
              child: Center(
            child: SafeArea(
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: double.infinity,
                    child: FutureBuilder(
                      future: futureList,
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else {
                          List<Post> posts = snapshot.data!;
                          return ListView.builder(
                            itemCount: posts.length,
                            itemBuilder: (BuildContext context, int index) {
                              Post post = posts[index];
                              return ListTile(
                                title: Text(post.title),
                                subtitle: Text(post.body),
                              );
                            },
                          );
                        }
                      },
                    ),
                  )),
            ),
          )),
        ]));
  }
}
