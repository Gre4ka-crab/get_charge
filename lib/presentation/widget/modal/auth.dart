import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_charge/presentation/widget/buttons/GradientButton.dart';
import 'package:get_charge/presentation/widget/buttons/LineButton.dart';
import '../buttons/SilverButton.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 16),
              width: 55,
              height: 6,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 250, 250, 250),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            )
          ],
        ),
        const Text(
          'Выберите способ верификации',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SilverButton(
                callback: () {},
                buttonLabel: 'Telegram',
                svgPicture: SvgPicture.asset('images/silverTelegram.svg'),
                padding: const EdgeInsets.only(left: 30, right: 30, top: 26),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              GradientButton(
                callback: () => Navigator.pushNamed(context, '/auth/number'),
                buttonLabel: 'Звонок',
                svgPicture: SvgPicture.asset('images/phone.svg'),
                padding: const EdgeInsets.only(left: 30, right: 30),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              LineButton(
                  callback: () {},
                  buttonLabel: 'Поддержка',
                  padding: const EdgeInsets.only(left: 30, right: 30))
            ],
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 84, right: 84, bottom: 42, top: 26),
          child: RichText(
              text: TextSpan(
                  style: const TextStyle(
                      color: Color.fromARGB(255, 134, 135, 137), fontSize: 10),
                  text: 'При входе или регистрации ты принимаешь условия ',
                  children: [
                TextSpan(
                    text: 'пользовательского и политики конфиденциальности',
                    style: const TextStyle(color: Colors.blue),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        debugPrint('Тут политика');
                      })
              ])),
        ),
      ],
    );
  }
}
