import 'package:flutter/material.dart';

class Helpers{
  static openModal(BuildContext context, Widget returnWidget) {
    showModalBottomSheet<void>(
        backgroundColor: Colors.white,
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        builder: (BuildContext context) {
          return returnWidget;
        });
  }

  static displayDialog(BuildContext context, Widget widget) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: animation.drive(Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)),
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return widget;
      },
    );
  }
}