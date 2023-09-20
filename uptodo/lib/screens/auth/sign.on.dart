import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:uptodo/routes/routes.navigation.dart';
import 'package:uptodo/utils/colours.dart';
import 'package:uptodo/utils/constants.dart';
import 'package:uptodo/utils/dimensions.dart';
import 'package:uptodo/utils/widgets/main.button.dart';
import 'package:uptodo/utils/widgets/text.field.dart';

class Signon extends StatefulHookWidget {
  const Signon({super.key});

  @override
  State<Signon> createState() => _SignonState();
}

class _SignonState extends State<Signon> {
  @override
  Widget build(BuildContext context) {
    var usernameController = useTextEditingController();
    var passwordController = useTextEditingController();
    var backgroundColor = useState(FADEDCOLOR);
    var borderColor = useState(Colors.transparent);
    var textColor = useState(LIGHTERTEXTCOLOR);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getScreenWidth(20)),
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
                  borderColor.value = BUTTONBACKGROUNDCOLOR;
                  backgroundColor.value = BUTTONCOLOR;
                  textColor.value = TEXTCOLOR;
                } else {
                  borderColor.value = Colors.transparent;
                  backgroundColor.value = FADEDCOLOR;
                  textColor.value = LIGHTERTEXTCOLOR;
                }
              },
            ),
            yMargin(20),
            UpTodoTextField(
              visible: true,
              header: "Password",
              controller: passwordController,
              hintText: "..........",
              onChange: (val) {
                if (val.isNotEmpty && usernameController.text.isNotEmpty) {
                  borderColor.value = BUTTONBACKGROUNDCOLOR;
                  backgroundColor.value = BUTTONCOLOR;
                  textColor.value = TEXTCOLOR;
                } else {
                  borderColor.value = Colors.transparent;
                  backgroundColor.value = FADEDCOLOR;
                  textColor.value = LIGHTERTEXTCOLOR;
                }
              },
            ),
            yMargin(40),
            UpToDoMainButton(
              text: "LOGIN",
              onTap: () {
                RouteNavigators.route(context, Signon());
              },
              cornerRadius: 6,
              height: 50,
              backgroundColor: backgroundColor.value,
              borderColor: borderColor.value,
              textColor: textColor.value,
            ),
          ],
        ),
      ),
    );
  }
}
