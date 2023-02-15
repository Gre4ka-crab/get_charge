import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrPromoCode extends StatelessWidget {
  final String link;
  const QrPromoCode({Key? key, required this.link}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: QrImage(
        data: link,
        version: QrVersions.auto,
        size: 200.0,
      ),
    );
  }
}
