import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_charge/presentation/Heplers.dart';
import 'package:get_charge/services/AuthService.dart';
import 'package:get_charge/presentation/widget/buttons/GradientButton.dart';

import '../widget/modal/AddCreditCart.dart';

// TODO Заглушка

class PayMentsScreen extends StatelessWidget {
  const PayMentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<BankCard> cards = AuthService.getCurrentUser().cards;
    ValueNotifier<int> selectCardId = ValueNotifier(0);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
          ),
        ],
        title: const Text('Способ оплаты'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Текщий способ оплаты',
                  style: TextStyle(color: Color.fromARGB(255, 134, 135, 137)),
                ),
                TextButton(
                    onPressed: () => Helpers.openModal(context, const AddCreditCart()),
                    child: const Text(
                      'Добавить карту',
                      style: TextStyle(fontSize: 11),
                    ))
              ],
            ),
            // Expanded(
            //     child: ValueListenableBuilder(builder: (BuildContext context, value, Widget? child) {
            //       return ListView.builder(
            //           itemCount: cards.length,
            //           itemBuilder: (BuildContext context, int index) {
            //             BankCard card = cards[index];
            //             bool isSelected = index == selectCardId.value;
            //
            //             return InkWell(
            //               onTap: () => selectCardId.value = index,
            //               child: Container(
            //                 decoration: BoxDecoration(
            //                     color: isSelected
            //                         ? const Color.fromARGB(255, 255, 218, 88)
            //                         : const Color.fromARGB(255, 241, 241, 241),
            //                     borderRadius: BorderRadius.circular(10)),
            //                 padding: const EdgeInsets.only(
            //                     top: 12, left: 21, bottom: 13, right: 20),
            //                 margin: const EdgeInsets.only(bottom: 6),
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Wrap(
            //                       direction: Axis.vertical,
            //                       children: [
            //                         const Text('Банковская карта'),
            //                         const Padding(padding: EdgeInsets.only(top: 6)),
            //                         Text('**** ${card.number}'),
            //                       ],
            //                     ),
            //                     isSelected
            //                         ? SvgPicture.asset('images/checkIcon.svg')
            //                         : const Padding(padding: EdgeInsets.zero)
            //                   ],
            //                 ),
            //               ),
            //             );
            //           });
            //     }, valueListenable: selectCardId,)),
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'СПОСОБЫ ОПЛАТЫ',
                      style: TextStyle(
                          color: Color.fromARGB(255, 134, 135, 137),
                          fontSize: 12),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {},
                            iconSize: 70,
                            icon: SvgPicture.asset('images/masterCard.svg')),
                        IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {},
                            iconSize: 70,
                            icon: SvgPicture.asset('images/visa.svg')),
                        IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {},
                            iconSize: 70,
                            icon: SvgPicture.asset('images/applePay.svg')),
                        IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {},
                            iconSize: 70,
                            icon: SvgPicture.asset('images/googlePay.svg')),
                      ],
                    ),
                    GradientButton(
                        callback: () {},
                        padding: const EdgeInsets.only(top: 60, bottom: 30),
                        buttonLabel: 'Изминить')
                  ],
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
