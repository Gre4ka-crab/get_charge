import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_charge/presentation/heplers.dart';
import 'package:get_charge/data/models/User/ProfileView.dart';
import 'package:get_charge/presentation/screens/history_list_screen.dart';
import 'package:get_charge/presentation/screens/pay_ments_screen.dart';
import 'package:get_charge/presentation/widget/buttons/GradientButton.dart';
import 'package:get_charge/presentation/widget/buttons/LineButton.dart';
import 'package:get_charge/presentation/widget/loading/Loading.dart';
import '../widget/menu/DrawerMenu.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String?> bottom = ValueNotifier('');

    TextEditingController emailText = TextEditingController();
    FocusNode inputFocusNode = FocusNode();

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: const Text('Профиль'),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(23),
            child: ValueListenableBuilder<String?>(
              valueListenable: bottom,
              builder: (BuildContext context, String? value, Widget? child) {
                if(value != '') {
                  return Text(
                    value ?? '',
                    style: const TextStyle(fontSize: 20),
                  );
                }
                return const Padding(padding: EdgeInsets.zero);
              },
            )),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () =>
              Navigator.of(context).popUntil((route) => route.isFirst),
        ),
      ),
      endDrawer: DrawerMenu.createMenu(context, DrawerMenu.defaultItemsList),
      body: Container(
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        child: FutureBuilder<ProfileView?>(
            // future: ProfilesController.getProfile(),
            builder: (BuildContext _, AsyncSnapshot<ProfileView?> snapshot) {
              debugPrint(snapshot.toString());

              if (!snapshot.hasData) {
                return const Loading();
              }

              emailText.text = snapshot.data!.email ?? '';

              bottom.value = snapshot.data!.phone;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 27, bottom: 23),
                    decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(10, 10)),
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 0, 158, 240),
                          Color.fromARGB(255, 53, 185, 255)
                        ])),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Вы заряжались',
                            style: TextStyle(color: Colors.white),
                          ),
                          Wrap(
                            children: [
                              SvgPicture.asset('images/lightning.svg'),
                              Text(
                                '  ${snapshot.data!.hours.toString()}h',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        focusNode: inputFocusNode,
                        enableInteractiveSelection: false,
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        controller: emailText,
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 134, 135, 137)),
                          labelText: 'Введите почту для отправки чеков',
                          contentPadding: const EdgeInsets.only(bottom: 13),
                          suffixIcon: IconButton(
                            onPressed: () {
                              FocusScope.of(context)
                                  .requestFocus(inputFocusNode);
                            },
                            icon: SvgPicture.asset('images/pen.svg'),
                          ),
                        ),
                      ))
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 14)),
                  Expanded(
                      child: Wrap(
                    children: [
                      ListTile(
                        title: const Text(
                          'История аренд',
                          style: TextStyle(height: 1, fontSize: 14),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 10),
                        contentPadding: EdgeInsets.zero,
                        shape: const Border(
                            bottom: BorderSide(
                                width: 1,
                                color: Color.fromARGB(255, 226, 226, 226))),
                        onTap: () => Helpers.displayDialog(
                            context, const HistoryListScreen()),
                      ),
                      ListTile(
                        title: const Text(
                          'Способ оплаты',
                          style: TextStyle(height: 1, fontSize: 14),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 10),
                        contentPadding: EdgeInsets.zero,
                        shape: const Border(
                            bottom: BorderSide(
                                width: 1,
                                color: Color.fromARGB(255, 226, 226, 226))),
                        onTap: () => Helpers.displayDialog(
                            context, const PayMentsScreen()),
                      ),
                    ],
                  )),
                  Row(
                    children: [
                      Expanded(
                          child: GradientButton(
                        callback: () =>
                            Navigator.pushNamed(context, '/profileRemove'),
                        buttonLabel: 'Удалить профиль',
                        borderRadius: const Radius.elliptical(15, 15),
                      )),
                      const Padding(padding: EdgeInsets.only(left: 15)),
                      Expanded(
                          child: LineButton(
                              callback: () {},
                              buttonLabel: 'Выйти',
                              borderRadius: const Radius.circular(15)))
                    ],
                  )
                ],
              );
            }),
      ),
    );
  }
}
