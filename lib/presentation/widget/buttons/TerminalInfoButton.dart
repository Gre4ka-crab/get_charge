import 'package:flutter/material.dart';

class TerminalInfoButton extends StatelessWidget {
  final Widget? leftWidget;
  final Widget? rightWidget;
  final VoidCallback? onTup;

  const TerminalInfoButton({Key? key, this.leftWidget, this.rightWidget, this.onTup})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTup,
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 241, 241, 241),
            borderRadius: BorderRadius.circular(5)),
        padding: const EdgeInsets.symmetric(
            vertical: 14, horizontal: 20),
        margin: const EdgeInsets.only(bottom: 9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: leftWidget,
            ),
            SizedBox(
              child: rightWidget,
            )
          ],
        ),
      ),
    );
  }
}
