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

  const GridItem({super.key, required this.item, required this.isSelected, required this.onTap});

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
