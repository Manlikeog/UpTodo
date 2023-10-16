import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:uptodo/screens/home/add_task/add_task.dart';
import 'package:uptodo/screens/home/calendar.dart';
import 'package:uptodo/screens/home/focuse.dart';
import 'package:uptodo/screens/home/home_screen.dart';
import 'package:uptodo/screens/home/profile.dart';
import 'package:uptodo/utils/colours.dart';
import 'package:uptodo/utils/constants.dart';
import 'package:uptodo/utils/dimensions.dart';

class HomeNavBar extends StatefulHookWidget {
  const HomeNavBar({super.key, this.currentScreen = 0});

  final int currentScreen;
  @override
  State<HomeNavBar> createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {
  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(widget.currentScreen);

    final screensToShow = <Widget>[
      const HomeScreen(),
      const Calendar(),
      const Focuse(),
      const Profile()
    ];
    return Scaffold(
      body: SizedBox(
        height: double.maxFinite,
        child: screensToShow[currentIndex.value],
      ),
      floatingActionButton: const AddTaskButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: HomeNavigationBar(
        currentIndex: currentIndex,
      ),
    );
  }
}

class HomeNavigationBar extends StatelessWidget {
  const HomeNavigationBar({Key? key, required this.currentIndex})
      : super(key: key);

  final ValueNotifier<int> currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: BOTTOMNAVCOLOR,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex.value,
      onTap: (index) => currentIndex.value = index,
      elevation: 2,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      selectedFontSize: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                yMargin(10),
                Image.asset(
                    currentIndex.value == 0
                        ? 'assets/images/home.png'
                        : 'assets/images/home_outline.png',
                    color: Colors.white),
                yMargin(5),
                Text(
                  'Home',
                  style: kTextStyleCustom(fontSize: 12),
                )
              ],
            ),
            label: 'Home'),
        BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.only(right: getScreenWidth(30)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                yMargin(10),
                Image.asset(
                  currentIndex.value == 1
                      ? 'assets/images/calendar.png'
                      : 'assets/images/calendar_outline.png',
                  color: Colors.white,
                ),
                yMargin(5),
                Text(
                  'Calendar',
                  style: kTextStyleCustom(fontSize: 12),
                )
              ],
            ),
          ),
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
          icon: Container(
            padding: EdgeInsets.only(left: getScreenWidth(30)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                yMargin(10),
                Image.asset(
                    currentIndex.value == 2
                        ? 'assets/images/clock.png'
                        : 'assets/images/clock_outline.png',
                    color: Colors.white),
                yMargin(5),
                Text(
                  'Focus',
                  style: kTextStyleCustom(fontSize: 12),
                )
              ],
            ),
          ),
          label: 'Focus',
        ),
        BottomNavigationBarItem(
          icon: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              yMargin(10),
              Image.asset('assets/images/user.png', color: Colors.white),
              yMargin(5),
              Text(
                'Profile',
                style: kTextStyleCustom(fontSize: 12),
              )
            ],
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
