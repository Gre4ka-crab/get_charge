import 'package:flutter/material.dart';
import 'package:get_charge/presentation/widget/buttons/GradientButton.dart';
import 'package:get_charge/presentation/widget/buttons/LineButton.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../widget/contry_code_piker.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController phone = TextEditingController();

    MaskTextInputFormatter phoneMask = MaskTextInputFormatter(
        mask: '(###) ###-##-##',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
        title: const Text('Вход по номеру телефона'),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Center(
          child: Wrap(
            children: [
              const Text(
                'Введите номер телефона, чтобы войти или зарегистрироваться',
                style: TextStyle(color: Color.fromARGB(255, 134, 135, 137)),
                textAlign: TextAlign.center,
              ),
              Container(
                height: 47,
                margin: const EdgeInsets.only(top: 39, bottom: 29),
                child: Row(
                  children: [
                    MyCountryCodePicker(
                      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
                      flagDecoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      padding: const EdgeInsets.only(
                          left: 20, top: 12, bottom: 12, right: 15),
                      showDropDownButton: true,
                      onChanged: print,
                      initialSelection: 'RU',
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                      textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    const Padding(padding: EdgeInsets.only(left: 13)),
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [phoneMask],
                        decoration: const InputDecoration(
                          hintText: 'Введите номер телефона',
                          hintStyle: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 134, 135, 137)),
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          filled: true,
                          fillColor: Color.fromARGB(255, 241, 241, 241),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              GradientButton(
                callback: () => Navigator.pushNamed(context, '/auth/number/confirm'),
                buttonLabel: 'Войти',
                padding: const EdgeInsets.only(bottom: 9),
              ),
              LineButton(callback: () {}, buttonLabel: 'Поддержка')
            ],
          ),
        ),
      ),
    );
  }
}
