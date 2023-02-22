import 'package:flutter/material.dart';
import 'package:get_charge/presentation/widget/buttons/GradientButton.dart';
import 'package:get_charge/presentation/widget/tabs/bonus/promo_code_link.dart';
import 'package:get_charge/presentation/widget/tabs/bonus/qr_promo_code.dart';

import '../widget/main_menu.dart';
import '../widget/tabs/bonus/promo_code.dart';

class _PlaceholderUser {
  String promoCode;
  String url;
  int bonuses;

  _PlaceholderUser(
      {required this.promoCode, required this.url, required this.bonuses});
}

class BonusScreen extends StatelessWidget {
  const BonusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = _PlaceholderUser(promoCode: 'cp122214', bonuses: 99, url: 'url');

    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Бонусы'),
            actions: [IconButton(
              icon: const Icon(Icons.close),
              onPressed: () =>
                  Navigator.of(context).popUntil((route) => route.isFirst),
            )],
          ),
          drawer: const MainMenu(),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 31, right: 29),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: const [
                        Text(
                          'Мои бонусы',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text('1 брнус = 1 руболь',
                            style: TextStyle(fontSize: 10))
                      ],
                    )),
                    Text(
                      user.bonuses.toString(),
                      style: const TextStyle(
                          fontSize: 50,
                          color: Color.fromARGB(255, 0, 158, 240)),
                    ),
                    const Padding(padding: EdgeInsets.only(right: 29))
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: const Divider(),
              ),
              TabBar(
                padding: const EdgeInsets.all(7.5),
                indicator: BoxDecoration(
                  color: const Color.fromARGB(255, 235, 208, 67),
                  border: Border.all(
                      color: const Color.fromARGB(255, 235, 208, 67)),
                  borderRadius: BorderRadius.circular(15),
                ),
                unselectedLabelColor: const Color.fromARGB(255, 134, 135, 137),
                labelColor: Colors.white,
                tabs: const [
                  Tab(text: 'Промокод'),
                  Tab(text: 'Отравить'),
                  Tab(text: 'По QR'),
                ],
              ),
              Expanded(
                  child: TabBarView(
                children: [
                  PromoCode(promoCode: user.promoCode),
                  PromoCodeLink(link: user.url),
                  QrPromoCode(link: user.url)
                ],
              )),
              const Divider(),
              GradientButton(
                callback: () => Navigator.pushNamed(context, '/modalGetBonus'),
                buttonLabel: 'Получить бонусы',
                padding: const EdgeInsets.only(left: 30, right: 30),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Правила начисления бонусов',
                    style: TextStyle(
                        fontSize: 12, decoration: TextDecoration.underline),
                  ))
            ],
          ),
        ));
  }
}
