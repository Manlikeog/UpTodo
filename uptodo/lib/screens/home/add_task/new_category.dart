import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:uptodo/utils/colours.dart';
import 'package:uptodo/utils/constants.dart';
import 'package:uptodo/utils/dimensions.dart';
import 'package:uptodo/utils/widgets/main.button.dart';
import 'package:uptodo/utils/widgets/text.field.dart';

class NewCategory extends StatefulHookWidget {
  const NewCategory({super.key});

  @override
  State<NewCategory> createState() => _NewCategoryState();
}

class _NewCategoryState extends State<NewCategory> {
  final random = Random();
  Color getRandomColor() {
    return Color.fromARGB(
      255,
      random.nextInt(256), // Red (0-255)
      random.nextInt(256), // Green (0-255)
      random.nextInt(256), // Blue (0-255)
    );
  }

  @override
  Widget build(BuildContext context) {
    var nameController = useTextEditingController();
    List<Color> randomColors = List.generate(15, (index) {
      return getRandomColor();
    });
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  yMargin(14),
                  Text(
                    'Create new category:',
                    style: kTextStyleBold(fontSize: 20),
                  ),
                  yMargin(10),
                  UpTodoTextField(
                    visible: true,
                    header: "Username",
                    controller: nameController,
                    hintText: "Enter your Username",
                  ),
                  yMargin(15),
                  Text(
                    'Category icon:',
                    style: kTextStyleCustom(fontSize: 16),
                  ),
                  yMargin(10),
                  Container(
                    width: getScreenWidth(190),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: BOTTOMNAVCOLOR),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Choose icon from library',
                        style: kTextStyleCustom(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  yMargin(10),
                  Text(
                    'Category color:',
                    style: kTextStyleCustom(fontSize: 16),
                  ),
                  yMargin(10),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: randomColors[index],
                            ),
                            width: 40,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                xMargin(40),
                Text(
                  'Cancel',
                  style: kTextStyleSemiBold(color: PRYCOLOR),
                ),
                xMargin(90),
                Expanded(
                  child: UpToDoMainButton(
                      text: "Create Category",
                      onTap: () {},
                      cornerRadius: 6,
                      height: 50,
                      onboarding: true,
                      backgroundColor: FADEDBUTTONCOLOR,
                      textColor: TEXTCOLOR),
                ),
              ],
            ),
            yMargin(40)
          ],
        ),
      ),
    );
  }
}
