import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note_app/constants/colors.dart';
import 'package:note_app/models/car.dart';
import 'package:note_app/models/student.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
  var box = Hive.box('names');
  var carBox = Hive.box<Car>('carBox');
  var studentBox = Hive.box<Student>('studentBox');

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE5E5E5),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(child: _getTaskItem()),
      ),
    );
  }

  Container _getTaskItem() {
    return Container(
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MSHCheckbox(
                        size: 30,
                        value: isChecked,
                        colorConfig:
                            MSHColorConfig.fromCheckedUncheckedDisabled(
                          checkedColor: AppColors.primaryGreen,
                        ),
                        style: MSHCheckboxStyle.fillScaleCheck,
                        onChanged: (selected) {
                          setState(() {
                            isChecked = selected;
                          });
                        },
                      ),
                      const Text('متن اینجا قرار می گیرد')
                    ],
                  ),
                  const Text('متن اینجا قرار می گیرد'),
                  const Spacer(),
                  Row(
                    children: [
                      _getbadge('time', '10:00', AppColors.primaryGreen,
                          Colors.white),
                      const SizedBox(
                        width: 15,
                      ),
                      _getbadge('edit', 'ویرایش', AppColors.lightGreen,
                          AppColors.primaryGreen),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Image.asset(
              'images/banking.png',
              height: 130,
            ),
          ],
        ),
      ),
    );
  }

  Container _getbadge(String iconName, String badgeText, Color badgeBgColor,
      Color badgeTextColor) {
    return Container(
      width: 95,
      height: 28,
      decoration: BoxDecoration(
        color: badgeBgColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        child: Row(
          children: [
            Text(
              badgeText,
              style: TextStyle(color: badgeTextColor),
            ),
            const SizedBox(width: 8),
            Image.asset(
              'images/$iconName.png',
            ),
          ],
        ),
      ),
    );
  }
}
