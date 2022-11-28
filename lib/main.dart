import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<dynamic>(
                settings: const RouteSettings(name: '/page'),
                builder: (BuildContext context) => const Page(),
              ),
            );
          },
          child: const Text("Push route"),
        ),
      ),
    );
  }
}

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _Page();
}

class _Page extends State<Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Flushbar<dynamic>(
              flushbarPosition: FlushbarPosition.TOP,
              message: "test",
            ).show(context);
          },
          child: const Text("Launch flushbar"),
        ),
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
