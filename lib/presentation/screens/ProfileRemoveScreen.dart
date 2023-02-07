import 'package:flutter/material.dart';
import 'package:get_charge/presentation/widget/buttons/GradientButton.dart';

import '../widget/buttons/LineButton.dart';

class ProfileRemoveScreen extends StatelessWidget {
  const ProfileRemoveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pushReplacementNamed(context, '/'),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Wrap(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Вы действительно хотите',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'удалить профиль?',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 32)),
              Row(
                children: [
                  Expanded(
                      child: GradientButton(
                    callback: () {},
                    buttonLabel: 'Да',
                  )),
                  const Padding(padding: EdgeInsets.only(left: 15)),
                  Expanded(
                      child: LineButton(
                    callback: () => Navigator.pop(context),
                    buttonLabel: 'Отмена',
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
