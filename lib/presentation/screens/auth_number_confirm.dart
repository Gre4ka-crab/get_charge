import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_charge/presentation/block/auth/auth_cubit.dart';
import 'package:get_charge/presentation/screens/loading_screen.dart';
import 'package:get_charge/presentation/widget/buttons/SilverButton.dart';
import 'package:pinput/pinput.dart';

class AuthNumberConfirm extends StatelessWidget {
  final String phone;
  final String countryCod;

  const AuthNumberConfirm({Key? key, required this.phone, required this.countryCod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 62,
      height: 62,
      textStyle: const TextStyle(fontSize: 32),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(12),
      ),
    );

    const interval = Duration(seconds: 1);
    const int timerMaxSeconds = 60;
    ValueNotifier<int> currentSeconds = ValueNotifier(1);

    var duration = interval;
    Timer.periodic(duration, (timer) {
      currentSeconds.value = timer.tick;
      if (timer.tick >= timerMaxSeconds) timer.cancel();
    });

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(3),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );

    final PinTheme errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        border: Border.all(color: const Color.fromRGBO(255, 100, 100, 1)),
      ),
    );

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (BuildContext context, state){
        if (state is AuthLoaded) {
          if(state.isLogIn) Navigator.pushReplacementNamed(context, '/');
        }
      },
      builder: (BuildContext context, state) {

        if (state is AuthLading) {
          return const LoadingScreen();
        }

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.pushReplacementNamed(context, '/'),
              ),
            ],
            title: const Text('Вход по номеру телефона'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(9),
                  margin: const EdgeInsets.only(right: 30, left: 30, top: 10, bottom: 25),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 250, 250, 250), borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'images/ampiAvatar.svg',
                        width: 39,
                        height: 39,
                      ),
                      const Padding(padding: EdgeInsets.only(right: 14)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$countryCod $phone',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500, color: Color.fromARGB(255, 39, 39, 39)),
                          ),
                          const Text('Входящий звонок',
                              style: TextStyle(fontSize: 11, color: Color.fromARGB(255, 134, 135, 137))),
                        ],
                      ),
                    ],
                  ),
                ),
                const Center(
                  child: Text('Ответь на звонок'),
                ),
                const Center(
                  child: Text('Введите 4 цифры, которые назовет оператор'),
                ),
                const Padding(padding: EdgeInsets.only(top: 25)),
                Pinput(
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  errorPinTheme: errorPinTheme,
                  errorTextStyle: const TextStyle(fontSize: 12, color: Color.fromRGBO(255, 100, 100, 1)),
                  validator: (s) {
                    if (s != null && s.length >= 4) {
                      context.read<AuthCubit>().logIn(
                            login: '$countryCod${phone.replaceAll(RegExp(r'[\),\s,\(,-]+'), '')}',
                            code: '123',
                          );
                    }
                  },
                  autofocus: true,
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  // onCompleted: (pin) => print(pin),
                ),
                if (state is AuthError) ...[
                  SizedBox(height: 8.h),
                  const Center(
                    child: Text(
                      'Неверный код. Пожалуйста, попробуйте еще раз',
                      style: TextStyle(fontSize: 12, color: Color.fromRGBO(255, 100, 100, 1)),
                    ),
                  ),
                ],
                const Padding(padding: EdgeInsets.only(top: 19)),
                ValueListenableBuilder<int>(
                  valueListenable: currentSeconds,
                  builder: (BuildContext context, int value, Widget? child) {
                    if (value >= 60) return const SizedBox.shrink();
                    return Wrap(
                      children: [
                        const Text(
                          'Повторный звонок через ',
                          style: TextStyle(color: Color.fromARGB(255, 134, 135, 137)),
                        ),
                        Text((60 - value).toString())
                      ],
                    );
                  },
                ),
                const Padding(padding: EdgeInsets.only(top: 4)),
                SilverButton(callback: () {}, buttonLabel: 'Повторить')
              ],
            ),
          ),
        );
      },
    );
  }
}
