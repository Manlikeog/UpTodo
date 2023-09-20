import 'package:flutter/material.dart';
import 'package:uptodo/utils/colours.dart';
import 'package:uptodo/utils/dimensions.dart';

const kUserStored = 'user';

Widget yMargin(double size) {
  return SizedBox(
    height: getScreenHeight(size),
  );
}

Widget xMargin(double size) {
  return SizedBox(
    width: getScreenWidth(size),
  );
}

// kToastMsgPopUp({String msg = 'error', bool success = false}) {
//   Fluttertoast.showToast(
//     msg: msg,
//     toastLength: Toast.LENGTH_SHORT,
//     gravity: ToastGravity.TOP,
//     timeInSecForIosWeb: 1,
//     backgroundColor: !success ? PRYCOLOR : GREENCOLOR,
//     textColor: WHITECOLOR,
//     fontSize: getScreenHeight(16),
//   );
// }

TextStyle kTextStyleCustom({
  Color color = TEXTCOLOR,
  double fontSize = 16,
  FontStyle fontStyle = FontStyle.normal,
  FontWeight fontWeight = FontWeight.w400,
  String fontfamily = 'Lato',
}) {
  return TextStyle(
      fontSize: getScreenHeight(fontSize),
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      color: color,
      fontFamily: fontfamily);
}

TextStyle kTextStyleSemiBold({
  Color color = TEXTCOLOR,
  FontStyle fontStyle = FontStyle.normal,
  double fontSize = 16,
}) {
  return TextStyle(
    fontSize: getScreenHeight(fontSize),
    fontWeight: FontWeight.w600,
    fontStyle: fontStyle,
    color: color,
  );
}

TextStyle kTextStyleBold({
  Color color = TEXTCOLOR,
  FontStyle fontStyle = FontStyle.normal,
  double fontSize = 16,
}) {
  return TextStyle(
      fontSize: getScreenHeight(fontSize),
      fontWeight: FontWeight.w700,
      fontStyle: fontStyle,
      color: color,
      fontFamily: 'LatoBlack');
}

TextStyle kTextStyleReguler({
  Color color = TEXTCOLOR,
  FontStyle fontStyle = FontStyle.normal,
  double fontSize = 16,
}) {
  return TextStyle(
      fontSize: getScreenHeight(fontSize),
      fontWeight: FontWeight.w400,
      fontStyle: fontStyle,
      color: color,
      fontFamily: 'LatoLight');
}
