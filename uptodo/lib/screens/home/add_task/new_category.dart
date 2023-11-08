import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:uptodo/utils/constants.dart';
import 'package:uptodo/utils/dimensions.dart';
import 'package:uptodo/utils/widgets/text.field.dart';

class NewCategory extends StatefulHookWidget {
  const NewCategory({super.key});

  @override
  State<NewCategory> createState() => _NewCategoryState();
}

class _NewCategoryState extends State<NewCategory> {
  @override
  Widget build(BuildContext context) {
    var nameController = useTextEditingController();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            yMargin(74),
            Text(
              'Create new category:',
              style: kTextStyleBold(fontSize: 20),
            ),
            yMargin(15),
            UpTodoTextField(
              visible: true,
              header: "Username",
              controller: nameController,
              hintText: "Enter your Username",
            ),
          ],
        ),
      ),
    );
  }
}
