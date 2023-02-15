import 'package:flutter/material.dart';
import 'package:get_charge/presentation/widget/buttons/GradientButton.dart';

class PushQuery extends StatelessWidget {
  const PushQuery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 35, left: 30, right: 30),
      child: Wrap(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Container(
                  height: 6,
                  width: 55,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 241, 241, 241),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Будем напоминать о важном',
                style: TextStyle(
                  color: Color.fromARGB(255, 134, 135, 137),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(217, 217, 217, 0.29),
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                width: 16,
                height: 16,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: ()=> Navigator.pop(context),
                  icon: const Icon(
                    Icons.close,
                    size: 10,
                    color: Color.fromARGB(255, 134, 135, 137),
                  ),
                )
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 12, bottom: 23),
            child: const Text(
              'Подскажем ближайший автомат, когда садится телефон',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
            ),
          ),
          SizedBox(
            child: Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Image.asset(
                        'images/bell.png',
                        width: 70,
                        height: 64,
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Все что нужно - ', style: TextStyle(fontSize: 18)),
                    Text('разрешить пуши', style: TextStyle(fontSize: 18)),
                    Padding(padding: EdgeInsets.only(top: 7)),
                    Text(
                      'Никакого спама, только польза',
                      style:
                          TextStyle(color: Color.fromARGB(255, 134, 135, 137)),
                    )
                  ],
                )),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 22),
            child: GradientButton(callback: () {}, buttonLabel: 'Разрешить'),
          )
        ],
      ),
    );
  }
}
