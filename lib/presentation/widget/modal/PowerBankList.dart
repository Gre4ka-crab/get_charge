import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_charge/presentation/widget/buttons/GradientButton.dart';

class PowerBankList extends StatelessWidget {
  const PowerBankList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 6,
            margin: const EdgeInsets.only(
                top: 8, bottom: 16, right: 160, left: 160),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 241, 241, 241),
                borderRadius: BorderRadius.circular(3)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: const [
                    Text(
                      'Goodman, 2-й этаж',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    )
                  ]),
                  Row(children: const [
                    Text(
                      'ул. Охотный Ряд, д.2',
                      style: TextStyle(
                          color: Color.fromARGB(255, 134, 135, 137),
                          fontSize: 12),
                    )
                  ]),
                ],
              ),
              Column(
                children: [
                  Container(
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(217, 217, 217, 0.29),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      width: 16,
                      height: 16,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.close,
                          size: 10,
                          color: Color.fromARGB(255, 134, 135, 137),
                        ),
                      )),
                ],
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          SizedBox(
            height: 205,
            child: ListView.builder(
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              'images/batteryType2Level4.svg',
                              height: 36,
                            ),
                            const Padding(padding: EdgeInsets.only(left: 7)),
                            Column(
                              children: const [
                                Text(
                                  'Заряд',
                                  style: TextStyle(
                                      fontSize: 10,
                                      color:
                                          Color.fromARGB(255, 134, 135, 137)),
                                ),
                                Text(
                                  '204',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 39,
                          width: 120,
                          child: GradientButton(
                              callback: () {}, buttonLabel: 'Аренда'),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
