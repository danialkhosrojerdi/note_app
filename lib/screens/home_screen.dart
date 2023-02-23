import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/constants/colors.dart';
import 'package:note_app/screens/add_task_screen.dart';
import 'package:note_app/widgets/task_widget.dart';

import '../models/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var taskBox = Hive.box<Task>('taskBox');
  bool isFabBtnVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ValueListenableBuilder(
          valueListenable: taskBox.listenable(),
          builder: (context, value, child) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                setState(() {
                  if (notification.direction == ScrollDirection.forward) {
                    isFabBtnVisible = true;
                  } else if (notification.direction ==
                      ScrollDirection.reverse) {
                    isFabBtnVisible = false;
                  }
                });
                return true;
              },
              child: ListView.builder(
                itemCount: taskBox.values.length,
                itemBuilder: (context, index) {
                  var taskList = taskBox.values.toList();
                  return _getTaskItem(taskList, index);
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: Visibility(
        visible: isFabBtnVisible,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AddTaskScreen(),
              ),
            );
          },
          backgroundColor: AppColors.primaryGreen,
          child: Image.asset('images/icon_add.png'),
        ),
      ),
    );
  }

  Widget _getTaskItem(List<Task> taskList, int index) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) => taskList[index].delete(),
      child: TaskWidget(task: taskList[index]),
    );
  }
}
