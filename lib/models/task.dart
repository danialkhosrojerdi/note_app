// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive/hive.dart';
import 'package:note_app/models/task_type.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  @HiveField(0)
  String taskTitle;
  @HiveField(1)
  String taskSubTitle;
  @HiveField(2)
  bool isDone;
  @HiveField(3)
  DateTime dateTime;
  @HiveField(4)
  TaskType tasktype;

  Task({
    required this.taskTitle,
    required this.taskSubTitle,
    this.isDone = false,
    required this.dateTime,
    required this.tasktype,
  });
}
