import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:uptodo/utils/colours.dart';
import 'package:uptodo/utils/constants.dart';
import 'package:uptodo/utils/dimensions.dart';
import 'package:uptodo/utils/widgets/text.field.dart';

class HomeScreen extends StatefulHookWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var titleController = useTextEditingController();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            yMargin(74),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/sort.png',
                ),
                Text(
                  'Index',
                  style: kTextStyleCustom(fontSize: 20),
                ),
                const CircleAvatar()
              ],
            ),
            yMargin(30),
            UpTodoTextField(
              header: "Ud",
              controller: titleController,
              hintText: "Title",
              hintColor: NAVCOLOR,
              onChange: (val) {},
              prefixIcon: Image.asset('assets/images/search.png'),
            ),
            
            // yMargin(50),
            // Image.asset(
            //   'assets/images/checklist.png',
            //   height: getScreenHeight(250),
            //   width: getScreenWidth(250),
            //   fit: BoxFit.fill,
            // ),
            // Text(
            //   'What do you want to do today?',
            //   style: kTextStyleCustom(fontSize: 20),
            // ),
            // yMargin(10),
            // Text(
            //   'Tap + to add your tasks',
            //   style: kTextStyleCustom(),
            // )
          ],
        ),
      ),
    );
  }
}
