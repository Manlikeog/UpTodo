import 'package:flutter/material.dart';
import 'package:uptodo/utils/colours.dart';
import 'package:uptodo/utils/config.dart';
import 'package:uptodo/utils/constants.dart';
import 'package:uptodo/utils/dimensions.dart';
import 'package:uptodo/utils/widgets/main.button.dart';

class TodayTaskModel {
  final String title;
  final String date;
  final String categoryTitle;
  final String priorityType;
  final String catergoryIcon;
  final String subtitle;
  final int? categoryColor;

  TodayTaskModel(
      {required this.categoryTitle,
      required this.date,
      required this.priorityType,
      required this.title,
      required this.categoryColor,
      required this.subtitle,
      required this.catergoryIcon});
}

class TodayTaskItem extends StatelessWidget {
  final String title;
  final String date;
  final String categoryTitle;
  final String priorityType;
  final Function() ontap;
  const TodayTaskItem(
      {super.key,
      required this.categoryTitle,
      required this.date,
      required this.priorityType,
      required this.title,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: BOTTOMNAVCOLOR),
        margin: EdgeInsets.only(bottom: getScreenHeight(15)),
        child: Padding(
          padding: EdgeInsets.only(
              left: getScreenWidth(10),
              right: getScreenWidth(10),
              top: getScreenHeight(15),
              bottom: getScreenWidth(5)),
          child: Row(
            children: [
              const Icon(
                Icons.circle_outlined,
                color: LIGHTTEXTCOLOR,
                size: 25,
              ),
              xMargin(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: kTextStyleCustom(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  yMargin(3),
                  SizedBox(
                    width: getScreenWidth(280),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          date,
                          style: kTextStyleCustom(
                              fontSize: 14, fontWeight: FontWeight.w300),
                        ),
                        Row(
                          children: [
                            CategoryType(
                              icon: Image.asset(
                                'assets/images/${determineColorType(categoryTitle).icon}.png',
                                height: getScreenHeight(10),
                              ),
                              text: categoryTitle,
                              categoryColor: Color(
                                  determineColorType(categoryTitle).color ??
                                      000000),
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
                                    horizontal: getScreenWidth(8)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/flag.png',
                                      height: getScreenHeight(14),
                                    ),
                                    xMargin(5),
                                    Text(
                                      priorityType,
                                      style: kTextStyleReguler(
                                          color: TEXTCOLOR, fontSize: 14),
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
      ),
    );
  }
}

class CompletedTaskItem extends StatelessWidget {
  final String title;
  final String date;

  const CompletedTaskItem({super.key, required this.date, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: BOTTOMNAVCOLOR),
      margin: EdgeInsets.only(bottom: getScreenHeight(15)),
      child: Padding(
        padding: EdgeInsets.only(
            left: getScreenWidth(10),
            right: getScreenWidth(10),
            top: getScreenHeight(10),
            bottom: getScreenWidth(5)),
        child: Row(
          children: [
            const Icon(
              Icons.circle_outlined,
              color: LIGHTTEXTCOLOR,
              size: 25,
            ),
            xMargin(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: kTextStyleCustom(
                      fontSize: 16, fontWeight: FontWeight.w400),
                ),
                yMargin(3),
                Text(
                  date,
                  style: kTextStyleCustom(
                      fontSize: 14, fontWeight: FontWeight.w300),
                ),
              ],
            ),
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
              style: kTextStyleCustom(fontSize: 12, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
