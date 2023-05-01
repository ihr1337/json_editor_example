import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:json_editor_example/pages/main_page.dart';
import 'package:redux/redux.dart';

import 'pages/items_list.dart';
import 'redux/app_state.dart';
import 'redux/reducers.dart';

void main() {
  Store<AppState> store = Store(reducer, initialState: AppState());

  runApp(ModularApp(module: HomeModule(), child: MyApp(store: store)));
}

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const MainPage()),
        ChildRoute('/items', child: (context, args) => const ItemsList()),
      ];
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({required this.store, super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: MaterialApp.router(
          routeInformationParser: Modular.routeInformationParser,
          routerDelegate: Modular.routerDelegate,
        ));
  }
}
