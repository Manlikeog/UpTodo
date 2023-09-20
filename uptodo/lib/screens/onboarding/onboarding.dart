import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:uptodo/routes/routes.navigation.dart';
import 'package:uptodo/screens/onboarding/resources/onboarding_model.dart';
import 'package:uptodo/screens/onboarding/start.screen.dart';
import 'package:uptodo/utils/colours.dart';
import 'package:uptodo/utils/constants.dart';
import 'package:uptodo/utils/dimensions.dart';
import 'package:uptodo/utils/widgets/main.button.dart';
import 'package:uptodo/utils/widgets/text.button.dart';

class Onboarding extends StatefulHookWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List<OnboardingModel> onBoardingDataList = [
    OnboardingModel(
        title: "Manage your tasks",
        subTitle:
            "You can easily manage all of your daily tasks in DoMe for free.",
        image: 'onBoarding1'),
    OnboardingModel(
        title: "Create daily routine",
        subTitle:
            "In Uptodo  you can create your personalized routine to stay productive.",
        image: 'onBoarding2'),
    OnboardingModel(
        title: "Organize your tasks",
        subTitle:
            "You can organize your daily tasks by adding your tasks into separate categories",
        image: 'onBoarding3'),
  ];
  @override
  Widget build(BuildContext context) {
    var currentIndex = useState(0);
    var pageController = usePageController();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            yMargin(74),
            UpToDoTextButton(
              onTap: () {
                RouteNavigators.route(context, const StartScreen());
              },
              title: "SKIP",
              color: LIGHTCOLOR,
              fontSize: getScreenHeight(16),
              fontWeight: FontWeight.w400,
            ),
            yMargin(25),
            Expanded(
              child: PageView.builder(
                onPageChanged: (data) {
                  currentIndex.value = data;
                },
                controller: pageController,
                itemCount: onBoardingDataList.length,
                itemBuilder: (context, index) {
                  OnboardingModel dataToUse = onBoardingDataList[index];
                  return OnboardingWidget(
                    title: dataToUse.title,
                    subTitle: dataToUse.subTitle,
                    image: dataToUse.image,
                    value: currentIndex.value,
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: UpToDoTextButton(
                    onTap: () {
                      pageController.previousPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.bounceIn);
                    },
                    title: "BACK",
                    color: LIGHTCOLOR,
                    fontSize: getScreenHeight(16),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                currentIndex.value == 2 ? xMargin(70) : xMargin(130),
                Expanded(
                  child: UpToDoMainButton(
                      text: currentIndex.value == 2 ? "GET STARTED" : "NEXT",
                      onTap: () {
                        currentIndex.value == 2
                            ? RouteNavigators.route(
                                context, const StartScreen())
                            : pageController.nextPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.bounceIn);
                      },
                      cornerRadius: 6,
                      height: 50,
                      onboarding: true,
                      textColor: TEXTCOLOR),
                ),
              ],
            ),
            yMargin(60)
          ],
        ),
      ),
    );
  }
}

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget(
      {super.key,
      required this.image,
      required this.subTitle,
      required this.title,
      required this.value});

  final String image;
  final String title;
  final String subTitle;
  final int value;

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset(
            'assets/images/${widget.image}.png',
            width: getScreenWidth(213),
            height: getScreenHeight(257),
          ),
        ),
        yMargin(40),
        //TAB MEDIATOR
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: getScreenHeight(4),
              width: getScreenWidth(26),
              decoration: ShapeDecoration(
                color: widget.value == 0 ? TEXTCOLOR : NAVCOLOR,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(56),
                ),
              ),
            ),
            xMargin(8),
            Container(
              height: getScreenHeight(4),
              width: getScreenWidth(26),
              decoration: ShapeDecoration(
                color: widget.value == 1 ? TEXTCOLOR : NAVCOLOR,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(56),
                ),
              ),
            ),
            xMargin(8),
            Container(
              height: getScreenHeight(4),
              width: getScreenWidth(26),
              decoration: ShapeDecoration(
                color: widget.value == 2 ? TEXTCOLOR : NAVCOLOR,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(56),
                ),
              ),
            ),
          ],
        ),
        yMargin(30),
        Center(
          child: Text(
            widget.title,
            style: kTextStyleBold(fontSize: 30, color: LIGHTTEXTCOLOR),
          ),
        ),
        yMargin(30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getScreenWidth(14)),
          child: Text(
            widget.subTitle,
            textAlign: TextAlign.center,
            style: kTextStyleReguler(
              color: LIGHTTEXTCOLOR,
            ),
          ),
        ),
      ],
    );
  }
}
