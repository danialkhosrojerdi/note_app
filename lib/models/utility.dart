import 'package:note_app/models/task_type.dart';
import 'package:note_app/models/task_type_enum.dart';

List<TaskType> taskTypeList = [
  TaskType(
    image: 'images/hard_working.png',
    title: 'کار عمیق',
    taskTypeEnum: TaskTypeEnum.work,
  ),
  TaskType(
    image: 'images/banking.png',
    title: 'کار بانکی',
    taskTypeEnum: TaskTypeEnum.bankWork,
  ),
  TaskType(
    image: 'images/meditate.png',
    title: 'تمرکز',
    taskTypeEnum: TaskTypeEnum.focus,
  ),
  TaskType(
    image: 'images/social_frends.png',
    title: 'دورهمی دوستانه',
    taskTypeEnum: TaskTypeEnum.meeting,
  ),
  TaskType(
    image: 'images/workout.png',
    title: 'ورزش',
    taskTypeEnum: TaskTypeEnum.workout,
  ),
];
