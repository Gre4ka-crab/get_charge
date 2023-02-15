import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_charge/presentation/widget/buttonBar/SocialBar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widget/menu/DrawerMenu.dart';

class AboutApplicationScreen extends StatelessWidget {
  const AboutApplicationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String siteLabel = 'www.site.ru';
    Uri siteUrl = Uri.parse('https://site.ru');

    _launchUrl(numberUrl) async {
      if (await canLaunchUrl(numberUrl)) {
        await launchUrl(numberUrl);
      } else {
        throw 'Не удалось подключится к $numberUrl';
      }
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'О приложении',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () =>
              Navigator.of(context).popUntil((route) => route.isFirst),
        ),
      ),
      endDrawer: DrawerMenu.createMenu(context, DrawerMenu.defaultItemsList),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 300,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(50, 50),
                    bottomRight: Radius.elliptical(50, 50)),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 0, 158, 240),
                  Color.fromARGB(255, 53, 185, 255)
                ]),
              ),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 50),
                  child: SvgPicture.asset('images/whiteLogoBattery.svg'),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 90)),
            Expanded(
                child: Column(
              children: [
                const Text('Сайт компании', style: TextStyle(fontSize: 18),),
                TextButton(
                    onPressed: () => _launchUrl(siteUrl),
                    child: Text(siteLabel, style: const TextStyle(fontSize: 18))),
                const Text('2022-2099,LLC"LLC"', style: TextStyle(fontSize: 18))
              ],
            )),
            const SocialBar(),
            const Padding(padding: EdgeInsets.only(top: 30))
          ],
        ),
      ),
    );
  }
}
