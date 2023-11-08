// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:uptodo/routes/routes.navigation.dart';
import 'package:uptodo/screens/home/add_task/item_model.dart';
import 'package:uptodo/screens/home/add_task/new_category.dart';
import 'package:uptodo/utils/colours.dart';
import 'package:uptodo/utils/config.dart';
import 'package:uptodo/utils/constants.dart';
import 'package:uptodo/utils/dimensions.dart';
import 'package:uptodo/utils/widgets/main.button.dart';
import 'package:uptodo/utils/widgets/text.field.dart';

class AddTaskButton extends StatefulHookWidget {
  const AddTaskButton({
    super.key,
  });

  @override
  State<AddTaskButton> createState() => _AddTaskButtonState();
}

class _AddTaskButtonState extends State<AddTaskButton> {
  List<ItemModel> items =
      List.generate(10, (index) => ItemModel(Icons.star, '${index + 1}'));
  int selectedItemIndex = -1;
  @override
  Widget build(BuildContext context) {
    var titleController = useTextEditingController();
    var subTitleController = useTextEditingController();

    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(getScreenHeight(10)),
                topRight: Radius.circular(
                  getScreenHeight(10),
                ),
              ),
            ),
            backgroundColor: BOTTOMNAVCOLOR,
            builder: (context) {
              return Container(
                height: getScreenHeight(250),
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      yMargin(20),
                      Text(
                        'Add Task',
                        style: kTextStyleBold(fontSize: 20),
                      ),
                      yMargin(20),
                      UpTodoTextField(
                        header: "Username",
                        controller: titleController,
                        hintText: "Title",
                        textFieldColor: TRANSPARENT,
                        borderColor: TRANSPARENT,
                        hintColor: NAVCOLOR,
                        onChange: (val) {},
                      ),
                      yMargin(10),
                      UpTodoTextField(
                        header: "Username",
                        controller: subTitleController,
                        hintText: "Description",
                        textFieldColor: TRANSPARENT,
                        borderColor: TRANSPARENT,
                        hintColor: NAVCOLOR,
                        onChange: (val) {},
                      ),
                      yMargin(20),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              showDateTimePicker(context: context);
                            },
                            child: Icon(
                              Icons.timer_outlined,
                              size: getScreenHeight(30),
                              color: LIGHTERTEXTCOLOR,
                            ),
                          ),
                          xMargin(15),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                        builder: (context, setstate) {
                                      return categoryPriority(setstate);
                                    });
                                  });
                            },
                            child: Image.asset(
                              'assets/images/tag.png',
                              height: getScreenHeight(30),
                              fit: BoxFit.fill,
                            ),
                          ),
                          xMargin(15),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return StatefulBuilder(
                                        builder: (context, setstate) {
                                      return taskPriority(setstate);
                                    });
                                  });
                            },
                            child: Image.asset(
                              'assets/images/flag.png',
                              height: getScreenHeight(30),
                              fit: BoxFit.fill,
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Image.asset(
                                'assets/images/send.png',
                                height: getScreenHeight(30),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            });
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: const Icon(Icons.add),
    );
  }

  Dialog taskPriority(StateSetter setstate) {
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
                  color: Color(determineColorType(dataToUse.text)),
                  onTap: () {
                    if (dataToUse.text == 'Create New') {
                      RouteNavigators.route(context, NewCategory());
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

Future<DateTime?> showDateTimePicker({
  required BuildContext context,
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  initialDate ??= DateTime.now();
  firstDate ??= initialDate.subtract(const Duration(days: 365 * 100));
  lastDate ??= firstDate.add(const Duration(days: 365 * 200));

  final DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: firstDate,
    lastDate: lastDate,
  );

  if (selectedDate == null) return null;

  if (!context.mounted) return selectedDate;

  final TimeOfDay? selectedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.fromDateTime(selectedDate),
  );

  return selectedTime == null
      ? selectedDate
      : DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedTime.hour,
          selectedTime.minute,
        );
}
