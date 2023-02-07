import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  final Widget icon;
  final void Function()? onPressed;
  final void Function(TapDownDetails)? onTapDown;
  final void Function(TapUpDetails)? onTapUp;
  final EdgeInsets? margin;

  const AppBarButton({Key? key, required this.icon, required this.onPressed, this.onTapDown, this.onTapUp, this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      child: Container(
        width: 38,
        height: 38,
        margin: margin ?? const EdgeInsets.all(0),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Color.fromRGBO(40, 40, 40, 0.25), blurRadius: 11, offset: Offset(0, 6))]),
        child: Center(child: icon),
      ),
    );
  }
}
