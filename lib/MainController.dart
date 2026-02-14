import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainController extends ChangeNotifier {
  int counter = 0;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

    );
  }
}

class MyWidget extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return Consumer<MainController>(
    builder: (context, controller, child) {
      return Column(
        children: [
          Text('Counter: ${controller.counter}'),
          ElevatedButton(
            onPressed: () {
              controller.incrementCounter();
            },
            child: Text('Increment'),
          ),
        ],
      );
    },
  );
}
}