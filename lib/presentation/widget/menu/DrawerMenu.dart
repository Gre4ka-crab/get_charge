import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_charge/presentation/widget/phone_info.dart';
import 'package:get_charge/presentation/widget/buttonBar/SocialBar.dart';

class MenuItem {
  Widget title;
  String assetName;
  String? routName;
  double? iconWidth;
  double? leadingRightPudding;

  MenuItem({
    this.routName,
    required this.assetName,
    required this.title,
    this.leadingRightPudding,
    this.iconWidth,
  });
}

class DrawerMenu {
  static final List<MenuItem> defaultItemsList = [
    MenuItem(title: const Text('Профиль'), routName: '/userProfile', assetName: 'images/person.svg'),
    MenuItem(
        title: Row(
          children: [
            const Text('Бонусы'),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Container(
                padding: const EdgeInsets.only(top: 5, left: 8, right: 6, bottom: 4),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 218, 88), borderRadius: BorderRadius.all(Radius.circular(3))),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: SvgPicture.asset('images/lightning.svg',
                          color: const Color.fromARGB(255, 89, 89, 89), width: 6, height: 11),
                    ),
                    const Text(
                      '0',
                      style: TextStyle(color: Color.fromARGB(255, 89, 89, 89)),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        routName: '/bonus',
        assetName: 'images/gift.svg'),
    MenuItem(title: const Text('Тарифы'), assetName: 'images/bagWithMoney.svg'),
    MenuItem(title: const Text('Акции'), assetName: 'images/sale.svg'),
    MenuItem(title: const Text('Документы'), assetName: 'images/docs.svg'),
    MenuItem(title: const Text('Поддержка'), assetName: 'images/headsetAndMic.svg'),
    MenuItem(title: const Text('Как это работает'), assetName: 'images/book.svg'),
    MenuItem(title: const Text('О приложении'), routName: '/aboutApplication', assetName: 'images/phoneMenu.svg'),
    MenuItem(
        title: const Text('Получи бонус'),
        routName: '/modalGetBonus',
        assetName: 'images/goldStar.svg',
        iconWidth: 23,
        leadingRightPudding: 16)
  ];

  static createMenu(BuildContext context, List<MenuItem> menuItems) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
          gradient: LinearGradient(colors: [Color.fromARGB(255, 0, 158, 240), Color.fromARGB(255, 53, 185, 255)])),
      child: Drawer(
        width: MediaQuery.of(context).size.width * 0.70,
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.only(left: 30, top: 38),
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.end,
                    children: [
                      PhoneInfo(
                        style: TextButton.styleFrom(
                            minimumSize: const Size(10, 20),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            padding: const EdgeInsets.only(bottom: 12),
                            foregroundColor: Colors.white,
                            textStyle: const TextStyle(
                              fontSize: 20,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12, right: 23),
                        child: SvgPicture.asset('images/whiteLogoBattery.svg', width: 21, height: 35),
                      ),
                      const Divider(
                        height: 1,
                        color: Colors.white,
                      ),
                    ],
                  )),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 30, top: 30),
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: menuItems.length,
                      itemBuilder: (context, index) {
                        MenuItem menuItem = menuItems[index];
                        List<Widget> child = [];
                        child.add(ListTile(
                          leading: Padding(
                            padding: EdgeInsets.only(right: menuItem.leadingRightPudding ?? 23),
                            child: SvgPicture.asset(
                              menuItem.assetName,
                              width: menuItem.iconWidth ?? 13,
                            ),
                          ),
                          textColor: Colors.white,
                          minLeadingWidth: 0,
                          contentPadding: EdgeInsets.zero,
                          horizontalTitleGap: 0,
                          visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                          title: menuItem.title,
                          onTap: () {
                            if (menuItem.routName != null) {
                              Navigator.pushNamed(context, menuItem.routName!);
                            }
                          },
                        ));
                        if ((index + 1) % 4 == 0) {
                          child.add(const Padding(
                              padding: EdgeInsets.only(bottom: 30, top: 30), child: Divider(height: 1, color: Colors.white)));
                        }
                        return Wrap(children: child);
                      }),
                ),
              ),
              const SocialBar(
                isColorReverse: true,
              ),
              const Padding(padding: EdgeInsets.only(top: 10))
            ],
          ),
        ),
      ),
    );
  }
}
