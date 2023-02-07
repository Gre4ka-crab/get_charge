import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GradientButton extends StatelessWidget {
  final void Function()? callback;
  final String buttonLabel;
  final EdgeInsets? padding;
  final Radius? borderRadius;
  final SvgPicture? svgPicture;

  const GradientButton(
      {Key? key,
      this.padding,
      this.borderRadius,
      this.svgPicture,
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
      style: const TextStyle(color: Colors.white),
    ));


    return Container(
      margin: padding,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.all(borderRadius ?? const Radius.elliptical(10, 10)),
          gradient: const LinearGradient(colors: [
            Color.fromARGB(255, 0, 158, 240),
            Color.fromARGB(255, 53, 185, 255)
          ])),
      child: TextButton(
        onPressed: callback,
        style: TextButton.styleFrom(
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
