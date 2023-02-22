import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_charge/presentation/widget/phone_info.dart';
import 'package:get_charge/presentation/widget/buttonBar/SocialBar.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 274.w,
        decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Color.fromARGB(255, 0, 158, 240), Color.fromARGB(255, 53, 185, 255)]),
            borderRadius: BorderRadius.only(topRight: Radius.circular(30.w), bottomRight: Radius.circular(30.w))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40.h, left: 30.w),
              child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close, color: Colors.white, size: 20.w),
              ),
            ),
            Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(left: 30.w, top: 38.h),
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  children: [
                    PhoneInfo(
                      style: TextButton.styleFrom(
                          minimumSize: const Size(10, 20),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          padding: EdgeInsets.only(bottom: 12.h),
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 12.h, right: 23.w),
                      child: SvgPicture.asset('images/whiteLogoBattery.svg', width: 21.w, height: 35.h),
                    ),
                    const Divider(height: 1, color: Colors.white),
                  ],
                )),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 30.w, top: 30.h),
                child: Column(
                  children: [
                    const _MenuItem(title: _ItemTitle('Профиль'), routName: '/userProfile', assetName: 'images/person.svg'),
                    _MenuItem(
                        title: Row(
                          children: [
                            const _ItemTitle('Бонусы'),
                            Padding(
                              padding: EdgeInsets.only(left: 18.w),
                              child: Container(
                                padding: EdgeInsets.only(top: 5.h, left: 8.w, right: 6.w, bottom: 4.h),
                                decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 255, 218, 88),
                                  borderRadius: BorderRadius.all(Radius.circular(3)),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(right: 5.w),
                                      child: SvgPicture.asset('images/lightning.svg',
                                          color: const Color.fromARGB(255, 89, 89, 89), width: 6.w, height: 11.h),
                                    ),
                                    const Text('0', style: TextStyle(color: Color.fromARGB(255, 89, 89, 89)))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        routName: '/bonus',
                        assetName: 'images/gift.svg'),
                    const _MenuItem(title: _ItemTitle('Тарифы'), assetName: 'images/bagWithMoney.svg'),
                    const _MenuItem(title: _ItemTitle('Акции'), assetName: 'images/sale.svg'),
                    Padding(
                      padding: EdgeInsets.only(bottom: 30.h, top: 30.h),
                      child: const Divider(height: 1, color: Colors.white),
                    ),
                    const _MenuItem(title: _ItemTitle('Документы'), assetName: 'images/docs.svg'),
                    const _MenuItem(title: _ItemTitle('Поддержка'), assetName: 'images/headsetAndMic.svg'),
                    const _MenuItem(
                        title: _ItemTitle('О приложении'), routName: '/aboutApplication', assetName: 'images/phoneMenu.svg'),
                    Padding(
                      padding: EdgeInsets.only(bottom: 30.h, top: 30.h),
                      child: const Divider(height: 1, color: Colors.white),
                    ),
                    _MenuItem(
                        title: const _ItemTitle('Получи бонус'),
                        routName: '/modalGetBonus',
                        assetName: 'images/goldStar.svg',
                        iconWidth: 23.w,
                        leadingRightPudding: 16.w)
                  ],
                ),
              ),
            ),
            const SocialBar(isColorReverse: true),
            Padding(padding: EdgeInsets.only(top: 10.h))
          ],
        ),
      ),
    );
  }
}

class _ItemTitle extends StatelessWidget {
  final String title;

  const _ItemTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title, style: const TextStyle(fontSize: 18));
  }
}

class _MenuItem extends StatelessWidget {
  final Widget title;
  final String assetName;
  final String? routName;
  final double? iconWidth;
  final double? leadingRightPudding;

  const _MenuItem({
    Key? key,
    this.routName,
    this.leadingRightPudding,
    this.iconWidth,
    required this.assetName,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: EdgeInsets.only(right: leadingRightPudding ?? 23.w),
        child: SvgPicture.asset(
          assetName,
          width: iconWidth ?? 13.w,
        ),
      ),
      textColor: Colors.white,
      minLeadingWidth: 0,
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0,
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      title: title,
      onTap: () {
        if (routName != null) {
          Navigator.pushNamed(context, routName!);
        }
      },
    );
  }
}
