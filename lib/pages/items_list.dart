import 'package:flutter/material.dart';

class ItemsList extends StatefulWidget {
  const ItemsList({super.key});

  @override
  State<ItemsList> createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
  List items = [1, 2, 3];

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
              child: Container(
                height: double.infinity,
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      child: Text('${items[index]}'),
                    );
                  },
                ),
              ),
            )),
          ),
        )
      ]),
    );
  }
}
