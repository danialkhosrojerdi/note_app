import 'package:hive_flutter/hive_flutter.dart';
part 'task_type_enum.g.dart';

@HiveType(typeId: 3)
enum TaskTypeEnum {
  @HiveField(0)
  work,
  @HiveField(1)
  education,
  @HiveField(2)
  reading,
  @HiveField(3)
  meeting,
  @HiveField(4)
  workout,
  @HiveField(5)
  bankWork,
  @HiveField(6)
  focus,
}
