// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../redux/actions.dart';
import '../redux/store.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({super.key, required this.data});
  final int data;

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  late int index;
  late int itemId;

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    index = widget.data;
    titleController.text = store.state.posts[index].title;
    bodyController.text = store.state.posts[index].body;
    itemId = store.state.posts[index].id;
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    bodyController.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Item index #$index'),
        ),
        body: CustomScrollView(scrollDirection: Axis.vertical, slivers: [
          SliverFillRemaining(
              child: Center(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: double.infinity,
                  child: Column(
                    children: [
                      const Text(
                        'Edit items:',
                        style: TextStyle(fontSize: 30),
                      ),
                      const SizedBox(height: 50),
                      TextField(
                        maxLines: null,
                        controller: titleController,
                      ),
                      TextField(
                        maxLines: null,
                        controller: bodyController,
                      ),
                      const SizedBox(height: 30),
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () => editItemThunk(index,
                                titleController.text, bodyController.text),
                            child: const Text(
                              'Update item with API query',
                              style: TextStyle(),
                            ),
                          ),
                          const SizedBox(width: 30),
                          ElevatedButton(
                            onPressed: () => editItem(),
                            child: const Text('Update item locally'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Text('Item ID: ${store.state.posts[index].id.toString()}')
                    ],
                  ),
                ),
              ),
            ),
          )),
        ]));
  }

  void editItem() {
    final String newTitle = titleController.text;
    final String newBody = bodyController.text;

    store.dispatch(EditItemAction(itemId, newTitle, newBody));
  }
}
