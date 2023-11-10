import 'package:flutter/material.dart';
import 'package:uptodo/utils/colours.dart';
import 'package:uptodo/utils/constants.dart';
import 'package:uptodo/utils/dimensions.dart';

class EditTask extends StatefulWidget {
  const EditTask({super.key});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
        child: Column(
          children: [
            yMargin(74),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: ShapeDecoration(
                    color: const Color(0xFF1C1C1C),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  child: Image.asset(
                    'assets/images/remove.png',
                    height: 40,
                    width: 40,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  decoration: ShapeDecoration(
                    color: const Color(0xFF1C1C1C),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  child: Image.asset(
                    'assets/images/repeat.png',
                    height: 30,
                    width: 30,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
            yMargin(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.circle_outlined,
                  color: LIGHTTEXTCOLOR,
                  size: 25,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Do Math Homework',
                      style: kTextStyleCustom(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'Do chapter 2 to 5 for next week',
                      style: kTextStyleCustom(
                          fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/edit.png',
                  height: 25,
                  width: 25,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            yMargin(20),
            Row(
              children: [
                Icon(
                  Icons.timer_outlined,
                  size: getScreenHeight(30),
                  color: LIGHTERTEXTCOLOR,
                ),
                xMargin(10),
                Text(
                  'Task Time:',
                  style: kTextStyleCustom(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
