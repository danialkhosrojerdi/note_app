// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:hive/hive.dart';
part 'student.g.dart';

@HiveType(typeId: 2)
class Student {
  @HiveField(0)
  String name;
  @HiveField(1)
  String familyName;
  @HiveField(2)
  double grade;
  @HiveField(3)
  int age;
  Student({
    required this.name,
    required this.familyName,
    required this.grade,
    required this.age,
  });
}
