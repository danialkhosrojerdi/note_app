import 'package:hive_flutter/hive_flutter.dart';
part 'car.g.dart';

@HiveType(typeId: 1)
class Car {
  @HiveField(0)
  String carName;
  @HiveField(1)
  int topSpeed;
  @HiveField(2)
  double price;
  Car({
    required this.carName,
    required this.topSpeed,
    required this.price,
  });
}
