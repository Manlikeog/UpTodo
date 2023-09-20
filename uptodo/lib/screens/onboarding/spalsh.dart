import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:uptodo/screens/auth/sign.on.dart';
import 'package:uptodo/screens/onboarding/onboarding.dart';
import 'package:uptodo/routes/routes.navigation.dart';
import 'package:uptodo/utils/config.dart';
import 'package:uptodo/utils/constants.dart';
import 'package:uptodo/utils/dimensions.dart';

class Splash extends StatefulHookWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    initialAction();

    super.initState();
  }

  Future<Timer> initialAction() async {
    // final num = await Helper.deviceInformation;

    return Timer(
      const Duration(seconds: 3),
      () {
        screeenToDisplay();
      },
    );
  }

  void screeenToDisplay() async {
    bool result = await checkIfIsFirstLaunch();

    if (result == true) {
      await writePrefData(kUserStored, 'store');
      if (context.mounted) {
        RouteNavigators.routeReplace(
          context,
          const Onboarding(),
        );
      }
    } else {
      if (context.mounted) {
        RouteNavigators.routeNoWayHome(
          context,
          const Signon(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final AnimationController controller = useAnimationController(
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    late final Animation<double> animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutBack,
    );
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: getScreenHeight(113),
            width: getScreenWidth(113),
            child: ScaleTransition(
              scale: animation,
              child: Image.asset(
                'assets/images/upTodo_logo.png',
              ),
            ),
          ),
          Center(
            child: Text(
              "UpTodo",
              style: kTextStyleBold(fontSize: 40, fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }
}
