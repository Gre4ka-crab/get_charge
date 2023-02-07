import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_charge/presentation/Heplers.dart';
import 'package:get_charge/presentation/widget/buttons/LineButton.dart';
import 'package:get_charge/presentation/widget/modal/AddCreditCart.dart';

class DepositInfoScreen extends StatelessWidget {
  const DepositInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 0, 158, 240),
            Color.fromARGB(255, 53, 185, 255)
          ]),
        ),
        padding: const EdgeInsets.only(left: 35, right: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            SvgPicture.asset('images/safe.svg'),
            const Padding(padding: EdgeInsets.only(top: 56)),
            const Text(
              'На этот автомат действует система резервирования 300 ₽ '
              'до возврата powerbank',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const Padding(padding: EdgeInsets.only(top: 33)),
            const Text(
              'Стоимость аренды расчитывается по тарифу автомата.',
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: const EdgeInsets.only(top: 108),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LineButton(
                    callback: () => Navigator.pop(context),
                    buttonLabel: 'Отмена',
                    borderRadius: const Radius.circular(27),
                    backgroundColor: Colors.transparent,
                    borderColor: Colors.white,
                    textColor: Colors.white,
                    padding: const EdgeInsets.only(bottom: 7),
                  ),
                  LineButton(
                    callback: () =>
                        Navigator.pushNamed(context, '/getPowerBankInfo'),
                    buttonLabel: 'Продолжить',
                    borderRadius: const Radius.circular(27),
                    borderColor: Colors.transparent,
                    textColor: const Color.fromARGB(255, 0, 158, 240),
                    padding: const EdgeInsets.only(bottom: 7),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 50))
          ],
        ),
      ),
    );
  }
}
