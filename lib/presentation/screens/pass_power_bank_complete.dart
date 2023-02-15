import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_charge/presentation/widget/buttons/LineButton.dart';

class PassPowerBankComplete extends StatelessWidget {
  const PassPowerBankComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'images/headsetAndMic.svg',
            color: Colors.white,
          ),
          onPressed: () {},
        ),
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
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 0, 158, 240),
                Color.fromARGB(255, 53, 185, 255)
              ]),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset('images/giftBox.svg'),
                  const Padding(padding: EdgeInsets.only(top: 23)),
                  const Text(
                    'Заряд возвращен!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: Wrap(
              children: [
                LineButton(
                  callback: () => Navigator.pushNamedAndRemoveUntil(
                      context, '/qrScan', ModalRoute.withName('/')),
                  buttonLabel: 'Взять еще раз',
                  padding: const EdgeInsets.only(bottom: 7),
                  backgroundColor: Colors.transparent,
                  borderColor: Colors.white,
                  textColor: Colors.white,
                  borderRadius: const Radius.circular(27),
                  fontWeight: FontWeight.w500,
                ),
                LineButton(
                  callback: () => Navigator.pushNamed(context, '/'),
                  buttonLabel: 'Отлично',
                  padding: const EdgeInsets.only(bottom: 30),
                  borderColor: Colors.transparent,
                  borderRadius: const Radius.circular(27),
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
