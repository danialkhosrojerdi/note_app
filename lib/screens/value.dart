import 'package:flutter/material.dart';

class ValueScreen extends StatefulWidget {
  const ValueScreen({Key? key}) : super(key: key);

  @override
  State<ValueScreen> createState() => _ValueScreenState();
}

class _ValueScreenState extends State<ValueScreen> {
  ValueNotifier valueNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ValueListenableBuilder(
                  valueListenable: valueNotifier,
                  builder: (context, value, child) {
                    return Text(
                      '$value',
                      style: const TextStyle(fontSize: 40),
                    );
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    valueNotifier.value++;
                  },
                  child: const Text('Increase'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
