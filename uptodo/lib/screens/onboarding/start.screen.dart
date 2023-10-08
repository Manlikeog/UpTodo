import 'package:flutter/material.dart';
import 'package:uptodo/routes/routes.navigation.dart';
import 'package:uptodo/screens/auth/sign.on.dart';
import 'package:uptodo/screens/auth/sign.up.dart';
import 'package:uptodo/utils/colours.dart';
import 'package:uptodo/utils/constants.dart';
import 'package:uptodo/utils/dimensions.dart';
import 'package:uptodo/utils/widgets/main.button.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  yMargin(74),
                  GestureDetector(
                    onTap: () {
                      RouteNavigators.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: getScreenHeight(16),
                      color: TEXTCOLOR,
                    ),
                  ),
                  yMargin(40),
                  Center(
                    child: Text(
                      'Welcome to UpTodo',
                      style:
                          kTextStyleBold(fontSize: 30, color: LIGHTTEXTCOLOR),
                    ),
                  ),
                  yMargin(30),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
                    child: Text(
                      'Please login to your account or create new account to continue',
                      textAlign: TextAlign.center,
                      style: kTextStyleReguler(
                        color: LIGHTTEXTCOLOR,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            UpToDoMainButton(
                text: "LOGIN",
                onTap: () {
                  RouteNavigators.route(context, const Signon());
                },
                cornerRadius: 6,
                height: 50,
                onboarding: true,
                textColor: TEXTCOLOR),
            yMargin(20),
            UpToDoMainButton(
                text: "CREATE ACCOUNT",
                onTap: () {
                  RouteNavigators.route(context, const SignUp());
                },
                cornerRadius: 6,
                height: 50,
                onboarding: true,
                backgroundColor: Colors.transparent,
                textColor: TEXTCOLOR),
            yMargin(70)
          ],
        ),
      ),
    );
  }
}
