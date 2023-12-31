import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:uptodo/routes/routes.navigation.dart';
import 'package:uptodo/screens/home/home/resources/edit_task.dart';
import 'package:uptodo/screens/home/home/resources/task_model.dart';
import 'package:uptodo/utils/colours.dart';
import 'package:uptodo/utils/constants.dart';
import 'package:uptodo/utils/dimensions.dart';
import 'package:uptodo/utils/widgets/text.field.dart';

class HomeScreen extends StatefulHookWidget {
  const HomeScreen({super.key, required this.availableTasks});
  final ValueNotifier<List<TodayTaskModel>> availableTasks;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var titleController = useTextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              widget.availableTasks.value.isNotEmpty
                  ? AvailableTask(
                      titleController: titleController,
                      availableTasks: widget.availableTasks,
                    )
                  : Column(
                      children: [
                        yMargin(50),
                        Image.asset(
                          'assets/images/checklist.png',
                          height: getScreenHeight(250),
                          width: getScreenWidth(250),
                          fit: BoxFit.fill,
                        ),
                        Text(
                          'What do you want to do today?',
                          style: kTextStyleCustom(fontSize: 20),
                        ),
                        yMargin(10),
                        Text(
                          'Tap + to add your tasks',
                          style: kTextStyleCustom(),
                        )
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class AvailableTask extends StatefulHookWidget {
  const AvailableTask(
      {super.key, required this.titleController, required this.availableTasks});

  final TextEditingController titleController;
  final ValueNotifier<List<TodayTaskModel>> availableTasks;

  @override
  State<AvailableTask> createState() => _AvailableTaskState();
}

class _AvailableTaskState extends State<AvailableTask> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UpTodoTextField(
          header: "Ud",
          controller: widget.titleController,
          hintText: "Search for your Task...",
          hintColor: NAVCOLOR,
          onChange: (val) {},
          prefixIcon: Image.asset('assets/images/search.png'),
        ),
        yMargin(20),
        Container(
          width: getScreenWidth(90),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: BOTTOMNAVCOLOR),
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
        SizedBox(
          height: getScreenHeight(270),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: widget.availableTasks.value.length,
            itemBuilder: (context, index) {
              final dataToUse = widget.availableTasks.value[index];
              return TodayTaskItem(
                categoryTitle: dataToUse.categoryTitle,
                date: dataToUse.date,
                priorityType: dataToUse.priorityType,
                title: dataToUse.title,
                ontap: () {
                  RouteNavigators.route(
                      context,
                      EditTask(
                        title: dataToUse.title,
                        taskPriority: dataToUse.priorityType,
                        categoryTitle: dataToUse.categoryTitle,
                        date: dataToUse.date,
                        subtitle: dataToUse.subtitle,
                      ));
                },
              );
            },
          ),
        ),
        yMargin(20),
        Container(
          width: getScreenWidth(120),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: BOTTOMNAVCOLOR),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Completed',
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
        yMargin(15),
        SizedBox(
          height: getScreenHeight(300),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 1,
            itemBuilder: (context, index) {
              final dataToUse = widget.availableTasks.value[index];
              return CompletedTaskItem(
                  date: dataToUse.date, title: dataToUse.title);
            },
          ),
        ),
      ],
    );
  }
}
