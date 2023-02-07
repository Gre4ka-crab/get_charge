import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LineButton extends StatelessWidget {
  final void Function()? callback;
  final String buttonLabel;
  final EdgeInsets? padding;
  final Radius? borderRadius;
  final SvgPicture? svgPicture;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final FontWeight? fontWeight;

  const LineButton({
    Key? key,
    this.borderRadius,
    this.svgPicture,
    this.padding,
    this.textColor,
    this.backgroundColor,
    this.borderColor,
    this.fontWeight,
    required this.callback,
    required this.buttonLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];

    if (svgPicture != null) {
      children = [
        Padding(padding: const EdgeInsets.only(right: 8), child: svgPicture),
      ];
    }

    children.add(Text(
      buttonLabel,
      style: TextStyle(
          color: textColor ?? const Color.fromARGB(255, 134, 135, 137),
          fontWeight: fontWeight ?? FontWeight.w400),
    ));

    return Container(
      padding: padding,
      child: OutlinedButton(
        onPressed: callback,
        style: OutlinedButton.styleFrom(
            backgroundColor: backgroundColor ?? Colors.white,
            minimumSize: const Size.fromHeight(50),
            side: BorderSide(
                color: borderColor ?? const Color.fromARGB(255, 134, 135, 137)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                borderRadius ?? const Radius.elliptical(10, 10),
              ),
            )),
        child: Wrap(
          children: children,
        ),
      ),
    );
  }
}
