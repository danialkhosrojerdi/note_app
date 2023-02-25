// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_type_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskTypeEnumAdapter extends TypeAdapter<TaskTypeEnum> {
  @override
  final int typeId = 3;

  @override
  TaskTypeEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TaskTypeEnum.work;
      case 1:
        return TaskTypeEnum.education;
      case 2:
        return TaskTypeEnum.reading;
      case 3:
        return TaskTypeEnum.meeting;
      case 4:
        return TaskTypeEnum.workout;
      case 5:
        return TaskTypeEnum.bankWork;
      case 6:
        return TaskTypeEnum.focus;
      default:
        return TaskTypeEnum.work;
    }
  }

  @override
  void write(BinaryWriter writer, TaskTypeEnum obj) {
    switch (obj) {
      case TaskTypeEnum.work:
        writer.writeByte(0);
        break;
      case TaskTypeEnum.education:
        writer.writeByte(1);
        break;
      case TaskTypeEnum.reading:
        writer.writeByte(2);
        break;
      case TaskTypeEnum.meeting:
        writer.writeByte(3);
        break;
      case TaskTypeEnum.workout:
        writer.writeByte(4);
        break;
      case TaskTypeEnum.bankWork:
        writer.writeByte(5);
        break;
      case TaskTypeEnum.focus:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskTypeEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
