import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_charge/presentation/widget/buttons/GradientButton.dart';

import '../inputs/DefaultInput.dart';
import '../main_menu.dart';

class GetBonus extends StatelessWidget {
  const GetBonus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController linkTextController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
      drawer: const MainMenu(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Center(
            child: Wrap(
              children: [
                Column(
                  children: [
                    SvgPicture.asset('images/blueGiftBox.svg'),
                    const Padding(padding: EdgeInsets.only(bottom: 15)),
                    DefaultInput(
                      controller: linkTextController,
                      placeholder: 'Введите промокод',
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 10)),
                    GradientButton(
                      callback: () => debugPrint(linkTextController.text),
                      buttonLabel: 'Активировать',
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
