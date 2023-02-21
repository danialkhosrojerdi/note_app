import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/models/car.dart';
import 'package:note_app/screens/home_screen.dart';

import 'models/student.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('names');
  Hive.registerAdapter(CarAdapter());
  await Hive.openBox<Car>('carBox');
  Hive.registerAdapter(StudentAdapter());
  await Hive.openBox<Student>('studentBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'shabnam'),
      home: const HomeScreen(),
    );
  }
}
