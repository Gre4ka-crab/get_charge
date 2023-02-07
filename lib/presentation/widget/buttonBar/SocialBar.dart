import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class _SocialItem {
  final SvgPicture image;
  final Uri url;

  _SocialItem({required this.url, required this.image});

  openUrl() async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Не удалось подключится к $url';
    }
  }
}

class SocialBar extends StatelessWidget {
  final bool? isColorReverse;

  const SocialBar({Key? key, this.isColorReverse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<_SocialItem> socialList = [
      _SocialItem(
          url: Uri.parse('https://ru-ru.facebook.com/'),
          image: SvgPicture.asset('images/facebook.svg')),
      _SocialItem(
          url: Uri.parse('https://twitter.com/'),
          image: SvgPicture.asset('images/twitter.svg')),
      _SocialItem(
          url: Uri.parse('http://vk.com/'),
          image: SvgPicture.asset('images/vk.svg')),
      _SocialItem(
          url: Uri.parse('https://www.youtube.com/'),
          image: SvgPicture.asset('images/youTube.svg')),
    ];

    if (isColorReverse ?? false) {
      socialList = [
        _SocialItem(
            url: Uri.parse('https://ru-ru.facebook.com/'),
            image: SvgPicture.asset('images/whiteFacebook.svg')),
        _SocialItem(
            url: Uri.parse('https://twitter.com/'),
            image: SvgPicture.asset('images/whiteTwitter.svg')),
        _SocialItem(
            url: Uri.parse('http://vk.com/'),
            image: SvgPicture.asset('images/whiteVk.svg')),
        _SocialItem(
            url: Uri.parse('https://www.youtube.com/'),
            image: SvgPicture.asset('images/whiteYouTube.svg')),
      ];
    }


    return Column(
      children: [
        ButtonBar(
          alignment: MainAxisAlignment.center,
          buttonPadding: EdgeInsets.zero,
          children: socialList.map((social) {
            return IconButton(
              iconSize: 36,
              constraints: const BoxConstraints(),
              padding: const EdgeInsets.only(right: 5),
              onPressed: () => social.openUrl(),
              icon: social.image,
            );
          }).toList(),
        ),
         Text(
          'Краткая информаация о владельце продукта',
          style: TextStyle(
              fontSize: 8, color: isColorReverse ?? false ? Colors.white :Colors.black),
        ),
      ],
    );
  }
}
