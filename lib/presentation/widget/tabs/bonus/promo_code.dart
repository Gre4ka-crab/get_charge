import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PromoCode extends StatelessWidget {
  final String promoCode;

  const PromoCode({Key? key, required this.promoCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 200),
        child: Center(
          child: Wrap(
            children: [
              Column(
                children: [
                  const Text('Можете поделиться этим промокодом с другом',
                      textAlign: TextAlign.center, style: TextStyle(height: 1.3)),
                  const Padding(padding: EdgeInsets.only(top: 40)),
                  Text(promoCode, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w700)),
                  const Padding(padding: EdgeInsets.only(top: 9)),
                  SizedBox(
                    height: 12,
                    child: TextButton(
                      style: TextButton.styleFrom(minimumSize: Size.zero, padding: EdgeInsets.zero),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: promoCode)).then((_) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Промокод скопирован")));
                        });
                        Clipboard.setData(ClipboardData(text: promoCode));
                      },
                      child: const Text('Скопировать', style: TextStyle(fontSize: 12)),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
