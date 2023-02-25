import 'package:flutter/material.dart';
import 'package:note_app/models/task.dart';
import 'package:note_app/screens/edit_task_screen.dart';

import '../constants/colors.dart';

class TaskWidget extends StatefulWidget {
  TaskWidget({Key? key, required this.task}) : super(key: key);
  Task task;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isBoxChecked = false;

  @override
  Widget build(BuildContext context) {
    return _getTaskItem();
  }

  Widget _getTaskItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isBoxChecked = !isBoxChecked;
            widget.task.isDone = isBoxChecked;
            widget.task.save();
          });
        },
        child: Container(
          height: 130,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Checkbox(
                            value: widget.task.isDone,
                            onChanged: (value) {},
                          ),
                          Text(widget.task.taskTitle),
                        ],
                      ),
                      Text(
                        widget.task.taskSubTitle,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          _getbadge(
                              'time',
                              '${widget.task.dateTime.hour} : ${getCorrectMinute(widget.task.dateTime)}',
                              AppColors.primaryGreen,
                              Colors.white),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EditTaskScreen(task: widget.task),
                                ),
                              );
                            },
                            child: _getbadge('edit', 'ویرایش',
                                AppColors.lightGreen, AppColors.primaryGreen),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  widget.task.tasktype.image,
                  height: 130,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Container _getbadge(String iconName, String badgeText, Color badgeBgColor,
    Color badgeTextColor) {
  return Container(
    width: 95,
    height: 28,
    decoration: BoxDecoration(
      color: badgeBgColor,
      borderRadius: BorderRadius.circular(18),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      child: Row(
        children: [
          Text(
            badgeText,
            style: TextStyle(color: badgeTextColor),
          ),
          const SizedBox(width: 8),
          Image.asset(
            'images/$iconName.png',
          ),
        ],
      ),
    ),
  );
}

String getCorrectMinute(DateTime time) {
  if (time.minute < 10) {
    return '0${time.minute}';
  } else {
    return time.minute.toString();
  }
}
