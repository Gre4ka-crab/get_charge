import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_charge/presentation/heplers.dart';
import 'package:get_charge/presentation/widget/buttons/GradientButton.dart';
import 'package:get_charge/presentation/widget/buttons/TerminalInfoButton.dart';
import 'package:get_charge/presentation/widget/modal/power_bank_list.dart';
import 'package:get_charge/presentation/widget/modal/terminal_timetable.dart';
import 'package:url_launcher/url_launcher.dart';

class _BottomInput extends StatelessWidget {
  final String leftText;
  final String rightText;

  const _BottomInput(
      {Key? key, required this.leftText, required this.rightText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: const TextStyle(
              color: Color.fromARGB(255, 134, 135, 137), fontSize: 12),
        ),
        Text(
          rightText,
          style: const TextStyle(
              color: Color.fromARGB(255, 134, 135, 137), fontSize: 12),
        )
      ],
    );
  }
}

// TODO Заглушка 3

class TerminalInfo extends StatelessWidget {
  final bool terminalOpen;

  const TerminalInfo({Key? key, required this.terminalOpen}) : super(key: key);

  static Future<void> openMap(double latitude, double longitude) async {
    Uri googleUrl = Uri.parse('geo:$latitude,$longitude');
    await launchUrl(googleUrl);
  }

  @override
  Widget build(BuildContext context) {

    return Wrap(
      children: [
        Container(
          height: 6,
          margin:
              const EdgeInsets.only(top: 8, bottom: 16, right: 160, left: 160),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 241, 241, 241),
              borderRadius: BorderRadius.circular(3)),
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Row(children: [
                  Text(
                    'terminal.title',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  )
                ]),
                Row(children: [
                  Text(
                    'terminal.address',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 134, 135, 137),
                        fontSize: 12),
                  )
                ]),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    Row(
                      children: [
                        Expanded(
                            child: TerminalInfoButton(
                                leftWidget: Row(
                                  children: [
                                    SvgPicture.asset('images/getPowerBank.svg',
                                        width: 18,
                                        height: 27,
                                        color: terminalOpen
                                            ? null
                                            : const Color.fromARGB(
                                                255, 134, 135, 137)),
                                    const Padding(
                                        padding: EdgeInsets.only(left: 15)),
                                    const Text(
                                      'Взять',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 134, 135, 137)),
                                    ),
                                  ],
                                ),
                                rightWidget: Text(
                                  'terminal.freePowerBank.length.toString()',
                                ))),
                        const Padding(padding: EdgeInsets.only(left: 5)),
                        Expanded(
                            child: TerminalInfoButton(
                                leftWidget: Row(
                                  children: [
                                    SvgPicture.asset(
                                        'images/returnPowerBank.svg',
                                        width: 18,
                                        height: 27,
                                        color: terminalOpen
                                            ? null
                                            : const Color.fromARGB(
                                                255, 134, 135, 137)),
                                    const Padding(
                                        padding: EdgeInsets.only(left: 15)),
                                    const Text(
                                      'Сдать',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 134, 135, 137)),
                                    ),
                                  ],
                                ),
                                rightWidget: Text(
                                  (''),
                                ))),
                      ],
                    ),
                    TextButton(
                        onPressed: terminalOpen
                            ? () => openMap(43.214707, 76.849618)
                            : null,
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft),
                        child: Wrap(
                          children: [
                            SvgPicture.asset('images/geoPoint.svg',
                                color: terminalOpen
                                    ? null
                                    : const Color.fromARGB(255, 134, 135, 137)),
                            const Padding(padding: EdgeInsets.only(left: 6)),
                            const Text(
                              'Построить маршрут',
                              style: TextStyle(height: 1),
                            )
                          ],
                        )),
                    const Padding(padding: EdgeInsets.only(top: 15)),
                    const Text(
                      '30р/час, затем 100р/сутки, далее 100р/сутки',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                const Padding(padding: EdgeInsets.only(top: 15)),
                Row(
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: const Size(0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: terminalOpen
                            ? () =>
                                Helpers.openModal(context, TerminalTimetable())
                            : null,
                        child: Row(
                          children: const [
                            Text(
                              'Открыто с 12:00 до 23:00',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 134, 135, 137)),
                            ),
                            Padding(padding: EdgeInsets.only(left: 5)),
                            Icon(
                              Icons.keyboard_arrow_down_sharp,
                              size: 10,
                              color: Color.fromARGB(255, 86, 192, 84),
                            )
                          ],
                        )),
                  ],
                ),
                terminalOpen
                    ? const Padding(padding: EdgeInsets.zero)
                    : Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 26),
                        margin: const EdgeInsets.only(top: 12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 134, 135, 137))),
                        child: const Text(
                          'Точка пока закрыта, '
                          'взять заряд можно будет в субботу, в 11:00',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                const Padding(padding: EdgeInsets.only(bottom: 16)),
                GradientButton(
                  callback: () => terminalOpen
                      ? () => Helpers.openModal(context, const PowerBankList())
                      : null,
                  buttonLabel: 'Взять заряд',
                  padding: const EdgeInsets.only(bottom: 15),
                )
              ],
            ))
      ],
    );
  }
}
