import 'package:flutter/material.dart';
import 'package:uptodo/utils/colours.dart';
import 'package:uptodo/utils/constants.dart';
import 'package:uptodo/utils/dimensions.dart';

class ItemModel {
  final IconData icon;
  final String text;

  ItemModel(this.icon, this.text);
}

class GridItem extends StatelessWidget {
  final ItemModel item;
  final bool isSelected;
  final VoidCallback onTap;

  const GridItem(
      {super.key,
      required this.item,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(getScreenHeight(8)),
        decoration: BoxDecoration(
          color: isSelected ? FADEDBUTTONCOLOR : TASKCOLOR,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            yMargin(3),
            Image.asset(
              'assets/images/flag.png',
              height: getScreenHeight(24),
              fit: BoxFit.fill,
            ),
            yMargin(3),
            Text(
              item.text,
              style: kTextStyleSemiBold(
                color: LIGHTCOLOR,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final CategoryModel item;
  final Color color;
  final VoidCallback onTap;

  const CategoryItem(
      {super.key,
      required this.item,
      required this.onTap,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.all(getScreenHeight(5)),
            padding: EdgeInsets.all(getScreenHeight(15)),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Image.asset(
              'assets/images/${item.icon}.png',
              height: getScreenHeight(18),
              width: getScreenWidth(18),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Text(
          item.text,
          style: kTextStyleCustom(color: TEXTCOLOR, fontSize: 12),
        ),
      ],
    );
  }
}

List<CategoryModel> categories = [
  CategoryModel('grocery', 'Grocery'),
  CategoryModel('work', 'Work'),
  CategoryModel('sport', 'Sport'),
  CategoryModel('design', 'Design'),
  CategoryModel('univeristy', 'University'),
  CategoryModel('social', 'Social'),
  CategoryModel('music', 'Music'),
  CategoryModel('health', 'Health'),
  CategoryModel('movie', 'Movie'),
  CategoryModel('house', 'Home'),
  CategoryModel('add_new', 'Create New'),
];

class CategoryModel {
  final String icon;
  final String text;

  CategoryModel(this.icon, this.text);
}
