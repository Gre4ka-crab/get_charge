import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SilverButton extends StatelessWidget {
  final void Function()? callback;
  final String buttonLabel;
  final EdgeInsets? padding;
  final Radius? borderRadius;
  final SvgPicture? svgPicture;

  const SilverButton(
      {Key? key,
      this.borderRadius,
      this.svgPicture,
      this.padding,
      required this.callback,
      required this.buttonLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    var children = <Widget>[];

    if(svgPicture != null){
      children = [
        Padding(padding: const EdgeInsets.only(right: 8), child: svgPicture),
      ];
    }

    children.add(Text(
      buttonLabel,
      style: const TextStyle(color: Color.fromARGB(255, 134, 135, 137)),
    ));

    return Container(
      padding: padding,
      child: TextButton(
        onPressed: callback,
        style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 250, 250, 250),
            minimumSize: const Size.fromHeight(50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                    borderRadius ?? const Radius.elliptical(10, 10)))),
        child: Wrap(
          children: children,
        ),
      ),
    );
  }
}
