import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../models/task_type.dart';

class TaskTypeListWidget extends StatelessWidget {
  TaskTypeListWidget({
    super.key,
    required this.tasktype,
    required this.selectedItem,
    required this.selectedItemIndex,
  });
  TaskType tasktype;
  int selectedItem;
  int selectedItemIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: 130,
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: (selectedItem == selectedItemIndex)
              ? AppColors.primaryGreen
              : Colors.transparent,
          width: 3,
        ),
      ),
      child: Column(
        children: [
          Image.asset(tasktype.image),
          const SizedBox(height: 5),
          Text(
            tasktype.title,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
