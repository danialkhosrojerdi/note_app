// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive_flutter/hive_flutter.dart';
import 'task_type_enum.dart';
part 'task_type.g.dart';

@HiveType(typeId: 2)
class TaskType {
  @HiveField(0)
  String image;
  @HiveField(1)
  String title;
  @HiveField(2)
  TaskTypeEnum taskTypeEnum;
  TaskType({
    required this.image,
    required this.title,
    required this.taskTypeEnum,
  });
}
