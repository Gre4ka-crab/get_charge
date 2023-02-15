import 'package:flutter/material.dart';
import 'package:get_charge/presentation/widget/buttons/SilverButton.dart';
import 'package:share_plus/share_plus.dart';

import '../../inputs/DefaultInput.dart';

class PromoCodeLink extends StatelessWidget {
  final String link;

  const PromoCodeLink({Key? key, required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController linkTextController =
    TextEditingController(text: link);
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 300),
        child: Center(
          child: Wrap(
            children: [
              Column(
                children: [
                  const Text(
                    'Отправьте друзьям промокод ссылкой',
                    textAlign: TextAlign.center,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 49)),
                  DefaultInput(
                    controller: linkTextController,
                    readOnly: true,
                  ),
                  const Padding(padding: EdgeInsets.only(top: 15)),
                  SilverButton(callback: () =>
                      Share.share(link, subject: 'Вам отравленн промокод!'),
                      buttonLabel: 'Отправить'
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
