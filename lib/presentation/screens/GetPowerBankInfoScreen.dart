import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GetPowerBankInfoScreen extends StatelessWidget {
  const GetPowerBankInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: SvgPicture.asset(
            'images/headsetAndMic.svg',
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 0, 158, 240),
            Color.fromARGB(255, 53, 185, 255)
          ]),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Возьмите заряд из автомата',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 27)),
              SvgPicture.asset('images/pastPoweBunkSheme.svg')
            ],
          ),
        ),
      ),
    );
  }
}
