import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uptodo/utils/colours.dart';
import 'package:uptodo/utils/constants.dart';
import 'package:uptodo/utils/dimensions.dart';

class UpTodoTextField extends StatefulWidget {
  const UpTodoTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.validator,
    this.enable = true,
    this.amount = false,
    this.inputAction = TextInputAction.done,
    this.visible = false,
    this.keyboardType,
    this.obscureText = false,
    this.validateMode = AutovalidateMode.onUserInteraction,
    this.header = "",
    this.borderRadius = 5,
    this.maxLines = 1,
    this.onEditingComplete,
    this.suffixIcon,
    this.formatters,
    this.onChange,
    this.icon,
  });
  final TextEditingController controller;
  final String hintText;
  final String header;
  final bool amount;
  final TextInputAction? inputAction;
  final bool visible;
  final int maxLines;
  final List<TextInputFormatter>? formatters;
  final String? Function(String?)? validator;
  final bool enable, obscureText;
  final TextInputType? keyboardType;
  final Function()? onEditingComplete;
  final Widget? suffixIcon;
  final double borderRadius;
  final AutovalidateMode validateMode;
  final Function(String)? onChange;
  final Widget? icon;
  final Widget? prefixIcon;

  @override
  State<UpTodoTextField> createState() => _EpawooTextFieldState();
}

class _EpawooTextFieldState extends State<UpTodoTextField> {
  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(getScreenHeight(widget.borderRadius)),
      borderSide: BorderSide(
          width: getScreenHeight(1),
          style: BorderStyle.solid,
          color: DIVIDERCOLOR),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.visible,
          child: Text(
            widget.header,
            style: kTextStyleReguler(color: LIGHTTEXTCOLOR),
          ),
        ),
        Visibility(
          visible: widget.visible,
          child: yMargin(6),
        ),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          autovalidateMode: widget.validateMode,
          enabled: widget.enable,
          textInputAction: widget.inputAction,
          cursorColor: PRYCOLOR,
          inputFormatters: widget.formatters ?? [],
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          obscureText: widget.obscureText,
          onEditingComplete: widget.onEditingComplete,
          onChanged: widget.onChange,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: widget.visible == true ? getScreenWidth(10) : 0,
              ),
              hintText: ' ${widget.hintText}',
              filled: true,
              fillColor: TEXTFIELDBORDERCOLOR,
              hintStyle:
                  kTextStyleReguler(fontSize: 16, color: TEXTFIELDHINTCOLOR),
              enabledBorder: outlineInputBorder,
              border: outlineInputBorder,
              disabledBorder: outlineInputBorder,
              errorBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(getScreenHeight(widget.borderRadius)),
                borderSide: BorderSide(
                  width: getScreenHeight(1),
                  style: BorderStyle.solid,
                  color: Colors.red,
                ),
              ),
              errorStyle: kTextStyleCustom(color: Colors.red, fontSize: 10),
              focusedBorder: outlineInputBorder,
              focusedErrorBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(getScreenHeight(widget.borderRadius)),
                borderSide: BorderSide(
                  width: getScreenHeight(1),
                  style: BorderStyle.solid,
                  color: Colors.red,
                ),
              ),
              suffixIcon: widget.suffixIcon,
              prefixIcon: widget.prefixIcon),
        ),
      ],
    );
  }
}
