// import 'package:flutter/material.dart';

// /// Custom dialog
// Future<void> showCustomAlertDialog(
//     {required BuildContext context,
//     AlertType? alertType,
//     String? title,
//     TextStyle? titleStyle,
//     String? message,
//     bool? showCloseButton,
//     String? positiveBtnText,
//     String? negativeBtnText,
//     Function? positiveBtnCallback,
//     Function? negativeBtnCallback,
//     bool? isHTML,
//     int popCount = 0}) async {
//   await showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return CustomAlertWidget(
//           alerType: alertType,
//           title: title,
//           titleStyle: titleStyle,
//           isHTML: isHTML,
//           description: message,
//           showCloseButton: showCloseButton,
//           positiveBtnText: positiveBtnText,
//           negativeBtnText: negativeBtnText,
//           negativeBtnPressed: negativeBtnCallback,
//           positiveBtnPressed: positiveBtnCallback,
//         );
//       });
// }
