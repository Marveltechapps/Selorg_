import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const kMobileBreakPoint = 640;
const kTabletBreakPoint = 720;
const kDesktopBreakPoint = 1024;

SystemUiOverlayStyle overlayStyle = SystemUiOverlayStyle(
  systemNavigationBarColor: Colors.green.shade200,
  systemNavigationBarIconBrightness: Brightness.light,
);

extension GridColumns on BuildContext {
  int getGridColumn() {
    var width = MediaQuery.of(this).size.width;
    if (width < kTabletBreakPoint) {
      return 2;
    } else if (width > kTabletBreakPoint && width < 1200) {
      return 3;
    } else if (width > kDesktopBreakPoint && width < 1500) {
      return 4;
    } else {
      return 5;
    }
  }
}

extension DynamicPadding on BuildContext {
  double getPadding() {
    var width = MediaQuery.of(this).size.width;
    if (width < kMobileBreakPoint) {
      return 8.0;
    } else if (width > kMobileBreakPoint && width < kTabletBreakPoint) {
      return 15.0;
    } else if (width > 720 && width < kDesktopBreakPoint) {
      return 75.0;
    }  else if (width > kDesktopBreakPoint && width < 1500) {
      return 120.0;
    } else {
      return 400.0;
    }
  }
}

extension SubCategoryPadding on BuildContext {
  double getSubCategoryPadding() {
    var width = MediaQuery.of(this).size.width;
    if (width < kMobileBreakPoint) {
      return 100.0;
    } else if (width > kMobileBreakPoint && width < 720) {
      return 120.0;
    } else if (width > 720 && width < 1024) {
      return 150.0;
    } else {
      return 200.0;
    }
  }
}
