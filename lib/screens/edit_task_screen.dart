import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app/constants/colors.dart';
import 'package:note_app/models/task.dart';

class EditTaskScreen extends StatefulWidget {
  EditTaskScreen({Key? key, required this.task}) : super(key: key);
  Task task;

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  TextEditingController? controllerTaskTitle;
  TextEditingController? controllerTaskSubTitle;
  final taskBox = Hive.box<Task>('taskBox');

  @override
  void initState() {
    controllerTaskTitle = TextEditingController(text: widget.task.taskTitle);
    controllerTaskSubTitle =
        TextEditingController(text: widget.task.taskSubTitle);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            _getTextField('عنوان تسک', 1, controllerTaskTitle!),
            const SizedBox(height: 20),
            _getTextField('توضیحات تسک', 2, controllerTaskSubTitle!),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: ElevatedButton(
                onPressed: () {
                  String taskTitle = controllerTaskTitle!.text;
                  String taskSubTitle = controllerTaskSubTitle!.text;
                  editTask(taskTitle, taskSubTitle);
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 45),
                    elevation: 0,
                    backgroundColor: AppColors.primaryGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                child: const Text(
                  'ویرایش تسک',
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

  editTask(String taskTitle, String taskSubTitle) {
    widget.task.taskTitle = taskTitle;
    widget.task.taskSubTitle = taskSubTitle;
    widget.task.save();
  }
}
