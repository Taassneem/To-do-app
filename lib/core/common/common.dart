import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/app_color.dart';

void navigate({required BuildContext context, required Widget screen}) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
}

void showToast({required String message, required ToastState state}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM_LEFT,
      timeInSecForIosWeb: 1,
      backgroundColor: getState(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastState { error, succces, warning }

Color getState(ToastState state) {
  switch (state) {
    case ToastState.error:
      return AppColors.red;
    case ToastState.succces:
      return AppColors.green;
    case ToastState.warning:
      return AppColors.orange;
  }
}
