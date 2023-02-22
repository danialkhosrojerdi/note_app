import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app/widgets/task_widget.dart';

import '../models/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var taskBox = Hive.box<Task>('taskBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffE5E5E5),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            itemCount: taskBox.values.length,
            itemBuilder: (context, index) {
              var taskList = taskBox.values.toList();
              return TaskWidget(task: taskList[index]);
            },
          ),
        ));
  }
}
