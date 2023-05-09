import 'package:flutter/material.dart';
import 'package:json_editor_example/constants/constants.dart';

import '../dio/dio.dart';
import '../models/post_model.dart';

class ItemDetails extends StatefulWidget {
  const ItemDetails({super.key, required this.data});
  final int data;

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  late int id;
  late Future<List<Post>> futureList;

  @override
  void initState() {
    super.initState();
    id = widget.data;
    futureList = DioClient().getPosts(baseUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Item index #$id'),
        ),
        body: CustomScrollView(scrollDirection: Axis.vertical, slivers: [
          SliverFillRemaining(
              child: Center(
            child: SafeArea(
              child: SizedBox(
                height: double.infinity,
                child: Column(
                  children: const [Text('template text')],
                ),
              ),
            ),
          )),
        ]));
  }
}
