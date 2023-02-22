import 'package:eticon_api/eticon_api.dart';
import 'package:flutter/material.dart';

import '../../heplers.dart';
import '../buttons/GradientButton.dart';
import '../modal/auth.dart';

class NoSelectedPowerBank extends StatelessWidget {
  const NoSelectedPowerBank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GradientButton(
          callback: () {
            if (Api.token != null) {
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
