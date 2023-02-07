import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../buttons/GradientButton.dart';

class SelectedPowerBank extends StatelessWidget {
  const SelectedPowerBank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<String> batteryLevels = [
      'images/batteryLevel0.svg',
      'images/batteryLevel1.svg',
      'images/batteryLevel2.svg',
      'images/batteryLevel3.svg',
      'images/batteryLevel4.svg',
      'images/batteryLevel5.svg',
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Row()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 21, bottom: 35),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 0, 158, 240),
                    Color.fromARGB(255, 53, 185, 255)
                  ])),
              child: Column(
                children: [
                  const Text(
                    'Заряд в аренде',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 8)),
                  const Text('№ заказа - 854967',
                      style: TextStyle(color: Colors.white)),
                  const Padding(padding: EdgeInsets.only(top: 27)),
                  SvgPicture.asset(batteryLevels[5])
                ],
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 19, bottom: 17),
                    child: Row(
                      children: [
                        SvgPicture.asset('images/timeIcon.svg'),
                        const Padding(padding: EdgeInsets.only(right: 14)),
                        Column(
                          children: const [
                            Text(
                              'До 14:02 19 авг',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              '50 р/час',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 134, 135, 137)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Column(),
                ],
              ),
              Container(
                color: const Color.fromARGB(255, 0, 158, 240),
                width: 1,
                height: 48,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 19, bottom: 17),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('images/dollar.svg'),
                        const Padding(padding: EdgeInsets.only(left: 14)),
                        Column(
                          children: const [
                            Text(
                              'Далее',
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              '100 р/сутки',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 134, 135, 137)),
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(),
                  ],
                ),
              ),
            ],
          ),
        ),
        GradientButton(
          callback: () => Navigator.pushNamed(context, '/passPowerBank'),
          buttonLabel: 'Сдать заряд',
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 26),
        ),
      ],
    );
  }
}
