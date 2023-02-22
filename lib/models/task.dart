// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive/hive.dart';
part 'task.g.dart';

@HiveType(typeId: 1)
class Task {
  @HiveField(0)
  String taskTitle;
  @HiveField(1)
  String taskSubTitle;
  @HiveField(2)
  bool isDone;
  Task({
    required this.taskTitle,
    required this.taskSubTitle,
    this.isDone = false,
  });
}
