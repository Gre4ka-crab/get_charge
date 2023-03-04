import 'package:flutter/material.dart';

import '../../heplers.dart';
import '../buttons/GradientButton.dart';
import '../modal/auth.dart';

class NoSelectedPowerBank extends StatelessWidget {
  final bool isLogIn;
  const NoSelectedPowerBank({Key? key, required this.isLogIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GradientButton(
          callback: () {
            if (isLogIn) {
              Navigator.pushNamed(context, '/qrScan');
            } else {
              Helpers.openModal(context, const Auth());
            }
          },
          buttonLabel: 'Взять заряд',
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 26),
        ),
      ],
    );
  }
}
