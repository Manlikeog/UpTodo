import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:uptodo/utils/colours.dart';
import 'package:uptodo/utils/constants.dart';
import 'package:uptodo/utils/dimensions.dart';
import 'package:uptodo/utils/widgets/main.button.dart';
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UpTodoTextField(
                  header: "Ud",
                  controller: titleController,
                  hintText: "Search for your Task...",
                  hintColor: NAVCOLOR,
                  onChange: (val) {},
                  prefixIcon: Image.asset('assets/images/search.png'),
                ),
                yMargin(20),
                Container(
                  width: getScreenWidth(90),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: BOTTOMNAVCOLOR),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Today',
                          style: kTextStyleCustom(fontSize: 14),
                        ),
                        xMargin(5),
                        const Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: LIGHTTEXTCOLOR,
                          size: 25,
                        )
                      ],
                    ),
                  ),
                ),
                yMargin(20),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: BOTTOMNAVCOLOR),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: getScreenWidth(10),
                        right: getScreenWidth(10),
                        top: getScreenHeight(15),
                        bottom: getScreenWidth(5)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.circle_outlined,
                          color: LIGHTTEXTCOLOR,
                          size: 25,
                        ),
                        xMargin(10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Do Math Homerwork',
                              style: kTextStyleCustom(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            yMargin(3),
                            SizedBox(
                              width: getScreenWidth(280),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Today',
                                    style: kTextStyleCustom(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Row(
                                    children: [
                                      CategoryType(
                                        icon: const Icon(
                                          Icons.work,
                                          color: LIGHTTEXTCOLOR,
                                          size: 15,
                                        ),
                                        text: 'University',
                                        categoryColor: PRYCOLOR,
                                      ),
                                      xMargin(10),
                                      UpToDoMainButton(
                                        text: "1",
                                        onTap: () {},
                                        cornerRadius: 6,
                                        height: 29,
                                        borderHeight: 1,
                                        useCustom: true,
                                        onboarding: true,
                                        backgroundColor: Colors.transparent,
                                        textColor: TEXTCOLOR,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                  'assets/images/flag.png'),
                                              xMargin(5),
                                              Text(
                                                "1",
                                                style: kTextStyleReguler(
                                                    color: TEXTCOLOR),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
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

class CategoryType extends StatelessWidget {
  const CategoryType(
      {super.key,
      required this.text,
      required this.icon,
      required this.categoryColor});

  final String text;
  final Widget icon;
  final Color categoryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: categoryColor),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            xMargin(5),
            Text(
              text,
              style: kTextStyleCustom(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
