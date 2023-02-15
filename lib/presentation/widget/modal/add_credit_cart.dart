import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddCreditCart extends StatelessWidget {
  const AddCreditCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartNumberText = TextEditingController();
    var cartValidityText = TextEditingController();
    var cartCvvText = TextEditingController();

    MaskTextInputFormatter cardValidityMask = MaskTextInputFormatter(
        mask: '##/##',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);

    MaskTextInputFormatter cardNumberMask = MaskTextInputFormatter(
        mask: '#### #### #### ####',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);

    MaskTextInputFormatter cardCvvMask = MaskTextInputFormatter(
        mask: '###',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);

    return SafeArea(
        child: Container(
      height: MediaQuery.of(context).size.height / 1.1,
      padding: const EdgeInsets.only(top: 8, bottom: 35, left: 30, right: 30),
      child: Column(
        children: [
          Wrap(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 16),
                      child: Container(
                        height: 6,
                        width: 55,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 241, 241, 241),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 33),
                child: Row(
                  children: [
                    const Expanded(
                        child: Text(
                      'Новая карта',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    )),
                    IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.close))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      inputFormatters: [cardNumberMask],
                      controller: cartNumberText,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        filled: true,
                        hintText: 'Номер карты',
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 134, 135, 137)),
                        fillColor: Color.fromARGB(255, 241, 241, 241),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: cartValidityText,
                      inputFormatters: [cardValidityMask],
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Срок действия',
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 134, 135, 137)),
                        filled: true,
                        fillColor: Color.fromARGB(255, 241, 241, 241),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 15)),
                  Expanded(
                      child: TextField(
                    inputFormatters: [cardCvvMask],
                    controller: cartCvvText,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'CVV',
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 134, 135, 137)),
                      filled: true,
                      fillColor: Color.fromARGB(255, 241, 241, 241),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  )),
                ],
              ),
            ],
          ),
          Expanded(child: Column()),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 241, 241, 241),
                minimumSize: const Size.fromHeight(50),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(27),
                  ),
                ),
              ),
              child: const Text(
                'Добавить карту',
                style: TextStyle(color: Colors.black),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
