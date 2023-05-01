import 'package:flutter/material.dart';

class ItemsList extends StatefulWidget {
  const ItemsList({super.key});

  @override
  State<ItemsList> createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
  List items = [];

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
              child: Expanded(
                child: Column(children: const []),
              ),
            )),
          ),
        )
      ]),
    );
  }
}
