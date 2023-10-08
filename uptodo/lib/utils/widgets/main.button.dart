import 'package:flutter/material.dart';
import 'package:uptodo/utils/colours.dart';

import '../constants.dart';
import '../dimensions.dart';

class UpToDoMainButton extends StatefulWidget {
  const UpToDoMainButton({
    super.key,
    this.backgroundColor = BUTTONCOLOR,
    this.cornerRadius = 16,
    this.borderColor = BUTTONBACKGROUNDCOLOR,
    this.borderHeight = 1.8,
    this.child,
    this.height = 30,
    this.elevation = 3,
    required this.text,
    this.textColor = TEXTCOLOR,
    this.useCustom = false,
    this.onboarding = false,
    required this.onTap,
  });
  final bool useCustom;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final double cornerRadius;
  final Color borderColor;
  final double borderHeight;
  final bool onboarding;
  final double height;
  final double elevation;
  final Widget? child;
  final Function() onTap;

  @override
  State<UpToDoMainButton> createState() => _UpToDoMainButtonState();
}

class _UpToDoMainButtonState extends State<UpToDoMainButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
            color: widget.backgroundColor,
            border: Border.all(
                color: widget.borderColor, width: getScreenWidth(widget.borderHeight)),
            borderRadius:
                BorderRadius.circular(getScreenHeight(widget.cornerRadius))),
        height: getScreenHeight(widget.height),
        child: Center(
          child: widget.useCustom
              ? widget.child
              : Text(
                  widget.text,
                  style: kTextStyleReguler(color: widget.textColor),
                ),
        ),
      ),
    );
  }
}
