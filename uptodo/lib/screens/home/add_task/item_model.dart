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
              color: TEXTCOLOR,
            ),
            yMargin(3),
            Text(
              item.text,
              style: kTextStyleCustom(color: TEXTCOLOR),
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
  CategoryModel(icon:'grocery', text:'Grocery', color: 0xFFCCFF7F),
  CategoryModel(icon:'work', text:'Work', color: 0xFFFF967F),
  CategoryModel(icon:'sport', text:'Sport', color: 0xFF7FFFFF),
  CategoryModel(icon:'design',text: 'Design', color: 0xFF7FFFD8),
  CategoryModel(icon: 'univeristy', text:'University', color: 0xFF7F9BFF),
  CategoryModel(icon:'social', text:'Social', color: 0xFFFF7FEA),
  CategoryModel(icon: 'music', text:'Music', color: 0xFFFC7FFF),
  CategoryModel(icon:'health', text: 'Health', color: 0xFF7FFFA3),
  CategoryModel(icon: 'movie', text: 'Movie', color: 0xFF7FD1FF),
  CategoryModel(icon: 'house', text: 'Home', color: 0xFFFFCC7F),
  CategoryModel(icon: 'add_new', text: 'Create New', color: 0xFF7FFFD1),
];

class CategoryModel {
  final String icon;
  final String text;
  final int? color;
  CategoryModel({ required this.icon, required this.text, this.color});
}
