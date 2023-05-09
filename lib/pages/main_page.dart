import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Main Page"),
        ),
        body: Center(
            child: SafeArea(
                child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Modular + Redux'),
              TextButton(
                  onPressed: () => Modular.to.pushNamed('/list'),
                  child: const Text('Open items list'))
            ],
          ),
        ))));
  }
}
