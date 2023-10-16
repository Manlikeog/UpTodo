import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:uptodo/routes/routes.navigation.dart';
import 'package:uptodo/screens/auth/sign.up.dart';
import 'package:uptodo/screens/home/home_nav_bar.dart';
import 'package:uptodo/screens/onboarding/start.screen.dart';
import 'package:uptodo/utils/colours.dart';
import 'package:uptodo/utils/constants.dart';
import 'package:uptodo/utils/dimensions.dart';
import 'package:uptodo/utils/widgets/main.button.dart';
import 'package:uptodo/utils/widgets/text.button.dart';
import 'package:uptodo/utils/widgets/text.field.dart';

class Signon extends StatefulHookWidget {
  const Signon({super.key});

  @override
  State<Signon> createState() => _SignonState();
}

class _SignonState extends State<Signon> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var usernameController = useTextEditingController();
    var passwordController = useTextEditingController();
    var backgroundColor = useState(FADEDCOLOR);
    var borderColor = useState(Colors.transparent);
    var textColor = useState(LIGHTERTEXTCOLOR);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              yMargin(74),
              GestureDetector(
                onTap: () {
                  RouteNavigators.route(context, const StartScreen());
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: getScreenHeight(16),
                  color: TEXTCOLOR,
                ),
              ),
              yMargin(40),
              Text(
                'Login',
                style: kTextStyleBold(fontSize: 30, color: LIGHTTEXTCOLOR),
              ),
              yMargin(30),
              UpTodoTextField(
                visible: true,
                header: "Username",
                controller: usernameController,
                hintText: "Enter your Username",
                onChange: (val) {
                  if (val.isNotEmpty && passwordController.text.isNotEmpty) {
                    borderColor.value = FADEDBUTTONCOLOR;
                    backgroundColor.value = FADEDBUTTONCOLOR;
                    textColor.value = TEXTCOLOR;
                  } else {
                    borderColor.value = Colors.transparent;
                    backgroundColor.value = FADEDCOLOR;
                    textColor.value = LIGHTERTEXTCOLOR;
                  }
                },
              ),
              yMargin(25),
              UpTodoTextField(
                visible: true,
                header: "Password",
                controller: passwordController,
                hintText: "••••••••••••",
                obscureText: true,
                onChange: (val) {
                  if (val.isNotEmpty && usernameController.text.isNotEmpty) {
                    borderColor.value = FADEDBUTTONCOLOR;
                    backgroundColor.value = FADEDBUTTONCOLOR;
                    textColor.value = TEXTCOLOR;
                  } else {
                    borderColor.value = Colors.transparent;
                    backgroundColor.value = FADEDCOLOR;
                    textColor.value = LIGHTERTEXTCOLOR;
                  }
                },
              ),
              yMargin(69),
              UpToDoMainButton(
                text: "Login",
                onTap: () {
                  RouteNavigators.route(context, const HomeNavBar());
                },
                cornerRadius: 6,
                height: 50,
                backgroundColor: backgroundColor.value,
                borderColor: borderColor.value,
                textColor: textColor.value,
              ),
              yMargin(45),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: DIVIDERCOLOR,
                      thickness: 1,
                    ),
                  ),
                  SizedBox(
                    width: getScreenHeight(5),
                  ),
                  Text(
                    'or',
                    style:
                        kTextStyleSemiBold(fontSize: 16, color: DIVIDERCOLOR),
                  ),
                  SizedBox(
                    width: getScreenHeight(5),
                  ),
                  const Expanded(
                    child: Divider(
                      color: DIVIDERCOLOR,
                      thickness: 1,
                    ),
                  )
                ],
              ),
              yMargin(24),
              UpToDoMainButton(
                text: "Login with Google",
                onTap: () {},
                cornerRadius: 6,
                height: 50,
                borderHeight: 1,
                useCustom: true,
                onboarding: true,
                backgroundColor: Colors.transparent,
                textColor: TEXTCOLOR,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/google.png'),
                    xMargin(10),
                    Text(
                      "Login with Google",
                      style: kTextStyleReguler(color: TEXTCOLOR),
                    ),
                  ],
                ),
              ),
              yMargin(20),
              UpToDoMainButton(
                text: "Login with Apple",
                onTap: () {},
                cornerRadius: 6,
                height: 50,
                borderHeight: 1,
                useCustom: true,
                onboarding: true,
                backgroundColor: Colors.transparent,
                textColor: TEXTCOLOR,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/apple.png'),
                    xMargin(10),
                    Text(
                      "Login with Apple",
                      style: kTextStyleReguler(color: TEXTCOLOR),
                    ),
                  ],
                ),
              ),
              yMargin(46),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: kTextStyleReguler(color: DIVIDERCOLOR),
                  ),
                  xMargin(4),
                  UpToDoTextButton(
                    onTap: () {
                      RouteNavigators.route(context, const SignUp());
                    },
                    title: "Register",
                    color: LIGHTTEXTCOLOR,
                    fontSize: getScreenHeight(16),
                    fontWeight: FontWeight.w400,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
