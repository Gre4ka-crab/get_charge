import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_charge/presentation/widget/buttons/GradientButton.dart';
import 'package:get_charge/presentation/widget/buttons/SilverButton.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

// TODO Заглушка 2
class TerminalSelected extends StatelessWidget {
  const TerminalSelected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController terminalNumberController = TextEditingController();
    MaskTextInputFormatter terminalNumberMask = MaskTextInputFormatter(
        mask: '# # # #',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);

    // final Terminal terminal = TerminalService.getTerminal(1);
    final arg = ModalRoute.of(context)?.settings.arguments
        as Map<String, QRViewController?>?;

    const listTextStyle =
        TextStyle(color: Color.fromARGB(255, 134, 135, 137), fontSize: 12);

    _pop() {
      arg?['cameraController']?.resumeCamera();
      Navigator.of(context).pop();
    }

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
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () => _pop(),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Wrap(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Title(
                    color: Colors.black,
                    child: const Text(
                      'Проверьте номер автомата',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 58)),
              Form(
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
                padding: const EdgeInsets.only(top: 23, bottom: 32),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'terminal.title',
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 6)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'images/geoPoint.svg',
                          color: const Color.fromARGB(255, 0, 158, 240),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 6)),
                        Text(
                          'address',
                          style: listTextStyle,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Депозит', style: TextStyle(fontSize: 12)),
                  Text('30 рублей',
                      style: const TextStyle(fontSize: 12))
                ],
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: const Divider(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Первый час', style: listTextStyle),
                  Text('${30} рублей',
                      style: listTextStyle)
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Первые сутки', style: listTextStyle),
                  Text('${30} рублей',
                      style: listTextStyle)
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Далее', style: listTextStyle),
                  Text('${30} рублей',
                      style: listTextStyle),
                ],
              ),
              GradientButton(
                callback: () => Navigator.pushNamed(context, '/depositInfoScreen'),
                buttonLabel: 'Продолжить',
                padding: const EdgeInsets.only(top: 36, bottom: 12),
              ),
              SilverButton(callback: () => _pop(), buttonLabel: 'Назад'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          SvgPicture.asset('images/coin.svg'),
                          const Padding(padding: EdgeInsets.only(right: 9)),
                          const Text(
                            'Что это такое депозит?',
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
