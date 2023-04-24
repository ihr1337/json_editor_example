import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends WidgetModule {
  HomeModule({super.key});

  @override
  List<Bind> get binds => [];

  @override
  Widget get view => const MainPage();

  List<ModularRoute> get routes =>
      [ChildRoute('/', child: (_, __) => const MainPage())];
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ItemList"), actions: const []),
      body: SingleChildScrollView(
          child: Center(
              child: SafeArea(
                  child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: const [Text('Modular + Redux')]),
      )))),
    );
  }
}
