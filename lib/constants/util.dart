import 'package:flutter/material.dart';

class Util {
  static MaterialColor customSwatchColor =
      MaterialColor(0xff880E4F, swatchPallette);
  static const Color activeColor = Color(0xff880e47);
  static const Color inActiveColor = Color.fromRGBO(
      136, 14, 71, 0.4); /* changed Color(0xff880e47) to equivalent in RGBO */

  //showLoading success title
  static String successTitle = successMsg[0];
  static String successBody = successMsg[1];
  static String failureTitle = failureMsg[0];
  static String failureBody = failureMsg[1];
}

/*
***********************************
this multi-line comment was created
to make a negative space here
***********************************
*/

// custom made swatchcolor pallette
Map<int, Color> swatchPallette = {
  50: const Color.fromRGBO(136, 14, 79, .1),
  100: const Color.fromRGBO(136, 14, 79, .2),
  200: const Color.fromRGBO(136, 14, 79, .3),
  300: const Color.fromRGBO(136, 14, 79, .4),
  400: const Color.fromRGBO(136, 14, 79, .5),
  500: const Color.fromRGBO(136, 14, 79, .6),
  600: const Color.fromRGBO(136, 14, 79, .7),
  700: const Color.fromRGBO(136, 14, 79, .8),
  800: const Color.fromRGBO(136, 14, 79, .9),
  900: const Color.fromRGBO(136, 14, 79, 1),
};

//for switching between gateway usage mode
class AppMode {
  static const statusFalse = false;
  static const statusTrue = true;
}

//message that displays in modalBox after making payment
var successMsg = [successMsgTitle, successMsgBody];
var failureMsg = [failureMsgTitle, failureMsgBody];

String successMsgTitle = 'Success';
String successMsgBody =
    '\nHi there,\nThank you for doing business with us. We will love to meet you again.\nHave a nice day.';

String failureMsgTitle = 'Oops !';
String failureMsgBody =
    '\nHi there,\nIt seems you are having trouble completing the transaction.\nEnsure all form fields are filled, and your internet connection is strong.\nYou can contact our helpline if the problem persist.';
