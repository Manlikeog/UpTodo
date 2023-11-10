import 'package:flutter/material.dart';
import 'package:uptodo/routes/routes.navigation.dart';
import 'package:uptodo/screens/home/add_task/item_model.dart';
import 'package:uptodo/screens/home/add_task/new_category.dart';
import 'package:uptodo/utils/colours.dart';
import 'package:uptodo/utils/config.dart';
import 'package:uptodo/utils/constants.dart';
import 'package:uptodo/utils/dimensions.dart';
import 'package:uptodo/utils/widgets/main.button.dart';

class EditTask extends StatefulWidget {
  const EditTask(
      {super.key,
      required this.title,
      required this.date,
      required this.categoryTitle,
      required this.subtitle,
      required this.taskPriority});
  final String title;
  final String subtitle;
  final String date;
  final String taskPriority;
  final String categoryTitle;
  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  List<ItemModel> items =
      List.generate(10, (index) => ItemModel(Icons.star, '${index + 1}'));
  int selectedItemIndex = -1;
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
                GestureDetector(
                  onTap: () {
                    RouteNavigators.pop(context);
                  },
                  child: Container(
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
              children: [
                const Icon(
                  Icons.circle_outlined,
                  color: LIGHTTEXTCOLOR,
                  size: 25,
                ),
                xMargin(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: kTextStyleCustom(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        widget.subtitle,
                        style: kTextStyleCustom(
                            fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/images/edit.png',
                  height: 25,
                  width: 25,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            yMargin(40),
            TaskDetails(
              action: 'Task Time:',
              detail: widget.date,
              image: 'timer',
              onTap: () {
                showDateTimePicker(context: context);
              },
            ),
            yMargin(25),
            TaskDetails(
              action: 'Task Category:',
              detail: widget.categoryTitle,
              image: 'tag',
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(builder: (context, setstate) {
                        return categoryPriority(setstate);
                      });
                    });
              },
            ),
            yMargin(25),
            TaskDetails(
              action: 'Task Priority:',
              detail: widget.taskPriority,
              image: 'flag',
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(builder: (context, setstate) {
                        return taskPriority(setstate);
                      });
                    });
              },
            ),
            yMargin(25),
            TaskDetails(
              action: 'Sub-Task:',
              detail: 'Add Sub-Task',
              image: 'hierarchy',
              onTap: () {},
            ),
            yMargin(25),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(builder: (context, setstate) {
                        return deleteTask(setstate);
                      });
                    });
              },
              child: Row(
                children: [
                  Image.asset('assets/images/trash.png'),
                  xMargin(10),
                  Text(
                    'Delete Task',
                    style: kTextStyleCustom(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: REDCOLOR),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Dialog categoryPriority(StateSetter setstate) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0)), //this right here
      backgroundColor: BOTTOMNAVCOLOR,
      child: SizedBox(
        height: getScreenHeight(450),
        child: Column(
          children: <Widget>[
            yMargin(10),
            Text('Choose Category', style: kTextStyleCustom(fontSize: 13)),
            const Divider(
              color: DIVIDERCOLOR,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Number of columns
                    childAspectRatio: 1 // Aspect ratio of items (square)
                    ),
                itemCount: categories.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final dataToUse = categories[index];
                  return CategoryItem(
                    item: dataToUse,
                    color: Color(dataToUse.color ?? 00000000),
                    onTap: () {
                      if (dataToUse.text == 'Create New') {
                        RouteNavigators.route(context, const NewCategory());
                      } else {
                        RouteNavigators.pop(context);
                      }
                    },
                  );
                },
              ),
            ),
            yMargin(20)
          ],
        ),
      ),
    );
  }

  Dialog taskPriority(
    StateSetter setstate,
  ) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)), //this right here
      backgroundColor: BOTTOMNAVCOLOR,
      child: SizedBox(
        height: getScreenHeight(350),
        width: 500.0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getScreenWidth(10)),
          child: Column(
            children: <Widget>[
              yMargin(10),
              Text('Task Priority', style: kTextStyleSemiBold()),
              const Divider(),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // Number of columns
                      childAspectRatio: 1 // Aspect ratio of items (square)
                      ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return GridItem(
                      item: items[index],
                      isSelected: selectedItemIndex == index,
                      onTap: () {
                        setstate(() {
                          selectedItemIndex = index;
                        });
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Cancel',
                      style: kTextStyleSemiBold(color: PRYCOLOR),
                    ),
                    xMargin(50),
                    Expanded(
                      child: UpToDoMainButton(
                          text: "Save",
                          onTap: () {},
                          cornerRadius: 6,
                          height: 50,
                          onboarding: true,
                          backgroundColor: FADEDBUTTONCOLOR,
                          textColor: TEXTCOLOR),
                    ),
                  ],
                ),
              ),
              yMargin(20)
            ],
          ),
        ),
      ),
    );
  }
}

Dialog deleteTask(StateSetter setstate) {
  return Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0)), //this right here
    backgroundColor: BOTTOMNAVCOLOR,
    child: SizedBox(
      height: getScreenHeight(180),
      width: 500.0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(10)),
        child: Column(
          children: <Widget>[
            yMargin(10),
            Text('Delete Task', style: kTextStyleSemiBold()),
            const Divider(),
            yMargin(10),
            Text(
              'Are you sure you want to delete this task? Task title: Do math homework',
              style: kTextStyleCustom(
                fontSize: 13,
              ),
              textAlign: TextAlign.center,
            ),
            yMargin(20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Cancel',
                    style: kTextStyleSemiBold(color: PRYCOLOR),
                  ),
                  xMargin(50),
                  Expanded(
                    child: UpToDoMainButton(
                        text: "Delete",
                        onTap: () {},
                        cornerRadius: 6,
                        height: 50,
                        onboarding: true,
                        backgroundColor: FADEDBUTTONCOLOR,
                        textColor: TEXTCOLOR),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class TaskDetails extends StatelessWidget {
  const TaskDetails(
      {super.key,
      required this.action,
      required this.detail,
      required this.image,
      required this.onTap});

  final String action;
  final String detail;
  final String image;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset('assets/images/$image.png'),
            xMargin(10),
            Text(
              action,
              style:
                  kTextStyleCustom(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: BOTTOMNAVCOLOR),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                detail,
                style: kTextStyleCustom(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
