import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneInfo extends StatelessWidget {
  final String? telUrl;
  final String? telString;
  final ButtonStyle? style;

  const PhoneInfo({Key? key, this.telUrl, this.telString, this.style})
      : super(key: key);

  static _launchCaller(numberUrl) async {
    if (await canLaunchUrl(numberUrl)) {
      await launchUrl(numberUrl);
    } else {
      throw 'Не удалось подключится к $numberUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Uri numberUrl = Uri.parse(telUrl ?? "tel:+79085511333");
    final String numberString = telString ?? '+7 908 55 11 333';

    return TextButton(
      onPressed: () => _launchCaller(numberUrl),
      style: style,
      child: Text(
        numberString,
        style: const TextStyle(letterSpacing: 0, height: 1),
      ),
    );
  }
}
