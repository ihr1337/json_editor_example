import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'pages/main_page.dart';

import 'redux/app_state.dart';
import 'redux/reducers.dart';

void main() {
  Store<AppState> store = Store(reducer, initialState: AppState());

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({required this.store, super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp(
          home: HomeModule(),
        ));
  }
}
