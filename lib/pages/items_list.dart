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

    futureList = fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text('${snapshot.data}'),
                              );
                            });
                      }
                      return Container(
                        child: Text('Snapshot is empty.'),
                      );
                    },
                  )),
            )),
          ),
        )
      ]),
    );
  }
}
