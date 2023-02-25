import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app/constants/colors.dart';
import 'package:note_app/models/task.dart';
import 'package:note_app/models/utility.dart';
import 'package:time_pickerr/time_pickerr.dart';

import '../widgets/task_type_widget.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController controllerTaskTitle = TextEditingController();
  final TextEditingController controllerTaskSubTitle = TextEditingController();
  final taskBox = Hive.box<Task>('taskBox');
  DateTime? _time;
  int _selectedListItem = 0;

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
            _getAddTimeForTaskBtn(context),
            const SizedBox(height: 20),
            _getTaskTypes(),
            const SizedBox(height: 20),
            _getAddTaskButton(context)
          ],
        ),
      ),
    );
  }

  SizedBox _getTaskTypes() {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: taskTypeList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                _selectedListItem = index;
              });
            },
            child: TaskTypeListWidget(
              tasktype: taskTypeList[index],
              selectedItem: _selectedListItem,
              selectedItemIndex: index,
            ),
          );
        },
      ),
    );
  }

  Widget _getAddTimeForTaskBtn(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return CustomHourPicker(
                title: 'زمان انجام تسک را انتخاب نمایید',
                negativeButtonText: 'لغو',
                positiveButtonText: 'انتخاب زمان',
                titleStyle: TextStyle(color: AppColors.primaryGreen),
                positiveButtonStyle: TextStyle(color: AppColors.primaryGreen),
                negativeButtonStyle:
                    const TextStyle(color: Color.fromARGB(255, 245, 76, 76)),
                elevation: 2,
                onPositivePressed: (context, time) {
                  _time = time;
                  Navigator.pop(context);
                },
                onNegativePressed: (context) {
                  Navigator.pop(context);
                },
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 45),
          elevation: 0,
          backgroundColor: AppColors.lightGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'انتخاب زمان انجام تسک',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryGreen,
          ),
        ),
      ),
    );
  }

  Widget _getAddTaskButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: ElevatedButton(
        onPressed: () {
          String taskTitle = controllerTaskTitle.text;
          String taskSubTitle = controllerTaskSubTitle.text;
          addTask(taskTitle, taskSubTitle);
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
          'اضافه کردن تسک',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
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
    var task = Task(
        taskTitle: taskTitle,
        taskSubTitle: taskSubTitle,
        dateTime: _time!,
        tasktype: taskTypeList[_selectedListItem]);
    taskBox.add(task);
  }
}
