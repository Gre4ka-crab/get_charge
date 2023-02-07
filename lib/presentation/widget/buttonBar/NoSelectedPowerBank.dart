import 'package:flutter/material.dart';
import 'package:get_charge/services/AuthService.dart';

import '../../Heplers.dart';
import '../buttons/GradientButton.dart';
import '../modal/Auth.dart';

class NoSelectedPowerBank extends StatelessWidget {
  const NoSelectedPowerBank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(),
        GradientButton(
          callback: () {
            if (AuthService.token != null) {
              Helpers.openModal(context, const Auth());
            } else {
              Navigator.pushNamed(context, '/qrScan');
            }
          },
          buttonLabel: 'Взять заряд',
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 26),
        ),
      ],
    );
  }
}
