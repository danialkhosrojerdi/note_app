import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app/constants/colors.dart';
import 'package:note_app/models/task.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController controllerTaskTitle = TextEditingController();
  final TextEditingController controllerTaskSubTitle = TextEditingController();
  final taskBox = Hive.box<Task>('taskBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            _getTextField('عنوان تسک', 1, controllerTaskTitle),
            const SizedBox(height: 20),
            _getTextField('توضیحات تسک', 2, controllerTaskSubTitle),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: ElevatedButton(
                onPressed: () {
                  String taskTitle = controllerTaskTitle.text;
                  String taskSubTitle = controllerTaskSubTitle.text;
                  addTask(taskTitle, taskSubTitle);
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 45),
                    elevation: 0,
                    backgroundColor: AppColors.primaryGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: const Text(
                  'اضافه کردن تسک',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getTextField(String labelText, int linesCount,
      TextEditingController textEditingController) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          controller: textEditingController,
          maxLines: linesCount,
          decoration: InputDecoration(
            floatingLabelStyle: TextStyle(
              color: AppColors.primaryGreen,
              fontSize: 18,
            ),
            contentPadding: const EdgeInsets.all(15),
            labelText: labelText,
            labelStyle: TextStyle(
              color: AppColors.grey,
              fontSize: 18,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              borderSide: BorderSide(
                color: AppColors.primaryGreen,
                width: 3,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              borderSide: BorderSide(
                color: AppColors.grey,
                width: 3,
              ),
            ),
          ),
        ),
      ),
    );
  }

  addTask(String taskTitle, String taskSubTitle) {
    var task = Task(taskTitle: taskTitle, taskSubTitle: taskSubTitle);
    taskBox.add(task);
  }
}
