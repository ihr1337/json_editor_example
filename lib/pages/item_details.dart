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

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    index = widget.data;
    titleController.text = store.state.posts[index].title;
    bodyController.text = store.state.posts[index].body;
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
                      const SizedBox(
                        height: 50,
                      ),
                      TextField(
                        maxLines: null,
                        controller: titleController,
                      ),
                      TextField(
                        maxLines: null,
                        controller: bodyController,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          onPressed: editItem,
                          child: const Text('Update item')),
                      const SizedBox(
                        height: 30,
                      ),
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

    store.dispatch(EditItemAction(index, newTitle, newBody));
  }
}
