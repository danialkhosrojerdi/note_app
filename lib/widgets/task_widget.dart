import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:note_app/models/task.dart';

import '../constants/colors.dart';

class TaskWidget extends StatefulWidget {
  TaskWidget({Key? key, required this.task}) : super(key: key);
  Task task;

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return _getTaskItem();
  }

  Widget _getTaskItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
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
                        MSHCheckbox(
                          size: 30,
                          value: isChecked,
                          colorConfig:
                              MSHColorConfig.fromCheckedUncheckedDisabled(
                            checkedColor: AppColors.primaryGreen,
                          ),
                          style: MSHCheckboxStyle.fillScaleCheck,
                          onChanged: (selected) {
                            setState(() {
                              isChecked = selected;
                            });
                          },
                        ),
                        Text(widget.task.taskTitle),
                      ],
                    ),
                    Text(widget.task.taskSubTitle),
                    const Spacer(),
                    Row(
                      children: [
                        _getbadge('time', '10:00', AppColors.primaryGreen,
                            Colors.white),
                        const SizedBox(
                          width: 15,
                        ),
                        _getbadge('edit', 'ویرایش', AppColors.lightGreen,
                            AppColors.primaryGreen),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Image.asset(
                'images/banking.png',
                height: 130,
              ),
            ],
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
