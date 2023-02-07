import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_charge/presentation/widget/buttons/GradientButton.dart';
import 'package:get_charge/presentation/widget/buttons/SilverButton.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PassPowerBank extends StatelessWidget {
  const PassPowerBank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Terminal terminal = TerminalService.getTerminal(1);
    TextEditingController terminalNumberController = TextEditingController();
    MaskTextInputFormatter terminalNumberMask = MaskTextInputFormatter(
        mask: '# # # #',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'images/headsetAndMic.svg',
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              const Text(
                'Проверьте номер автомата',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Container(
                padding: const EdgeInsets.only(top: 23, bottom: 26),
                child: TextFormField(
                  controller: terminalNumberController,
                  inputFormatters: [terminalNumberMask],
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(11),
                    labelStyle:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 171, 172, 174),
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    hintText: 'x x x x',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 26, bottom: 47),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'images/geoPoint.svg',
                      color: const Color.fromARGB(255, 0, 158, 240),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 3)),
                    Text(
                      'Адресс',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 134, 135, 137),
                          fontSize: 12),
                    ),
                  ],
                ),
              ),
              GradientButton(
                callback: () => Navigator.pushNamed(context, '/passPowerBankInfo'),
                buttonLabel: 'Сдать заряд',
                padding: const EdgeInsets.only(bottom: 13),
              ),
              SilverButton(
                  callback: () => Navigator.pop(context), buttonLabel: 'Назад')
            ],
          ),
        ),
      ),
    );
  }
}
