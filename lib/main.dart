import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'pages/item_details.dart';
import 'pages/main_page.dart';
import 'pages/items_list.dart';

import 'redux/app_state.dart';
import 'redux/store.dart';

void main() {
  runApp(ModularApp(module: HomeModule(), child: MyApp(store: store)));
}

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const MainPage()),
        ChildRoute('/list', child: (context, args) => const ItemsList()),
        ChildRoute('/list/item',
            child: (context, args) => ItemDetails(data: args.data)),
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
