import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading {
  Loading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 4000)
      ..indicatorType = EasyLoadingIndicatorType.cubeGrid
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 35.0
      ..lineWidth = 2
      ..radius = 10.0
      ..progressColor = const Color(0xffd3af37)
      ..backgroundColor = Colors.black87
      ..indicatorColor = const Color(0xffd3af37)
      ..textColor = const Color(0xffd3af37)
      ..maskColor = const Color(0xffd3af37)
      ..userInteractions = false
      ..dismissOnTap = false
      ..boxShadow = []
      ..maskType = EasyLoadingMaskType.none;
  }

  static void show([String? text]) {
    EasyLoading.show(
      status: text ?? 'Loading...',
      indicator: const SpinKitFoldingCube(
        color: Color(0xffd3af37),
      ),
      maskType: EasyLoadingMaskType.none,
    );
  }

  static void toast(String text) {
    EasyLoading.showToast(text);
  }

  static void success([String? text]) {
    EasyLoading.showSuccess(
      text ?? 'Success',
      maskType: EasyLoadingMaskType.none,
    );
  }

  static void error([String? text]) {
    EasyLoading.showError(
      text ?? 'Failed',
      maskType: EasyLoadingMaskType.none,
    );
  }

  static void dismiss() {
    EasyLoading.instance.userInteractions = true;
    EasyLoading.dismiss();
  }
}
