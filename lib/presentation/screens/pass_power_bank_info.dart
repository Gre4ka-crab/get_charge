import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_charge/presentation/widget/bristled_line.dart';

class PassPowerBankInfo extends StatelessWidget {
  const PassPowerBankInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 30, right: 65),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 0, 158, 240),
                Color.fromARGB(255, 53, 185, 255)
              ]),
            ),
            child: Column(
              children: [
                Expanded(child: Row()),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50))),
                          child: const Text(
                            '1',
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          width: 1,
                          height: 135,
                          child: VerticalBristledLine(),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50))),
                          child: const Text(
                            '2',
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(left: 16)),
                    Flexible(
                      child: Column(
                        children: [
                          const Text(
                            'Вставь заряд в пустую ячейку до щелчка',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 255, 218, 88)),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                right: 48, top: 18, bottom: 67),
                            child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.all(9),
                                  side: const BorderSide(
                                    color: Colors.white,
                                  ),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    SvgPicture.asset('images/warning.svg'),
                                    const SizedBox(width: 8),
                                    const Flexible(
                                        child: Text(
                                      'Убедись, что заряд невозможно достать',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    )),
                                  ],
                                )),
                          ),
                          const Text(
                            'Дождись сообщения “Заряд возвращен!”',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 255, 218, 88)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(child: Row()),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 48),
            child: Wrap(
              children: [
                const Text(
                  'Твой № заказа: 854967',
                  style: TextStyle(color: Colors.white),
                ),
                const Divider(color: Colors.white),
                Row(
                  children: [
                    const Flexible(
                        child: Text(
                      'Чтобы связаться со службой поддержки, нажми',
                      style: TextStyle(color: Colors.white),
                    )),
                    const Padding(padding: EdgeInsets.only(left: 50)),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          border: Border.all(color: Colors.white)),
                      // TODO Заменить роут
                      child: IconButton(
                        onPressed: () => Navigator.pushNamed(context, '/passPowerBankComplete'),
                        icon: SvgPicture.asset('images/headsetAndMic.svg'),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
