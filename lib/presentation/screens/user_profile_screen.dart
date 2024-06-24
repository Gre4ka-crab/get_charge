import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_charge/main.dart';
import 'package:get_charge/presentation/block/auth/auth_cubit.dart';
import 'package:get_charge/presentation/block/profile/profile_cubit.dart';
import 'package:get_charge/presentation/heplers.dart';
import 'package:get_charge/presentation/screens/history_list_screen.dart';
import 'package:get_charge/presentation/screens/loading_screen.dart';
import 'package:get_charge/presentation/screens/pay_ments_screen.dart';
import 'package:get_charge/presentation/widget/buttons/GradientButton.dart';
import 'package:get_charge/presentation/widget/buttons/LineButton.dart';
import '../widget/main_menu.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailText = TextEditingController();
    FocusNode inputFocusNode = FocusNode();

    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (BuildContext context, state) {
        if (state is ProfileExit) {
          Navigator.pushReplacementNamed(context, '/');
        }
      },
      builder: (BuildContext context, state) {
        if (state is ProfileInitial) {
          context.read<ProfileCubit>().getData();
        }

        if (state is ProfileError) {
          return AlertDialog(
            title: const Text('ERROR'),
            content: Text(state.error.toString()),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    context.read<ProfileCubit>().getData();
                  },
                  child: const Text('update')),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: const Text('back'))
            ],
          );
        }

        if (state is ProfileLoaded) {
          emailText.text = state.profileEntity.email ?? '';
          String? formatPhone = state.profileEntity.phone?.replaceAllMapped(
            RegExp(r'(\+\d)(\d{3})(\d{3})(\d{2})(\d{2})'),
            (Match m) => "${m[1]} (${m[2]}) ${m[3]}-${m[4]}-${m[5]}",
          );

          return Scaffold(
            appBar: AppBar(
              titleSpacing: 0.0,
              title: const Text('Профиль'),
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(23),
                  child: Text(
                    formatPhone ?? '',
                    style: const TextStyle(fontSize: 20),
                  )),
              actions: [IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
              )],
            ),
            drawer: const MainMenu(),
            body: Container(
              margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 27, bottom: 23),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
                      gradient: LinearGradient(colors: [Color.fromARGB(255, 0, 158, 240), Color.fromARGB(255, 53, 185, 255)]),
                    ),
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
                                '  ${state.profileEntity.hours.toString()}h',
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
                        onSubmitted: (value) {
                          context.read<ProfileCubit>().changeEmail(value);

                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        controller: emailText,
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(color: Color.fromARGB(255, 134, 135, 137)),
                          labelText: 'Введите почту для отправки чеков',
                          contentPadding: const EdgeInsets.only(bottom: 13),
                          suffixIcon: IconButton(
                            onPressed: () {
                              FocusScope.of(context).requestFocus(inputFocusNode);
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
                        shape: const Border(bottom: BorderSide(width: 1, color: Color.fromARGB(255, 226, 226, 226))),
                        onTap: () => Helpers.displayDialog(context, const HistoryListScreen()),
                      ),
                      ListTile(
                        title: const Text(
                          'Способ оплаты',
                          style: TextStyle(height: 1, fontSize: 14),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 10),
                        contentPadding: EdgeInsets.zero,
                        shape: const Border(bottom: BorderSide(width: 1, color: Color.fromARGB(255, 226, 226, 226))),
                        onTap: () => Helpers.displayDialog(context, const PayMentsScreen()),
                      ),
                    ],
                  )),
                  Row(
                    children: [
                      Expanded(
                          child: GradientButton(
                        callback: () => Navigator.pushNamed(context, '/profileRemove'),
                        buttonLabel: 'Удалить профиль',
                        borderRadius: const Radius.elliptical(15, 15),
                      )),
                      const Padding(padding: EdgeInsets.only(left: 15)),
                      Expanded(
                          child: LineButton(
                        callback: () => context.read<ProfileCubit>().logOut(context),
                        buttonLabel: 'Выйти',
                        borderRadius: const Radius.circular(15),
                      ))
                    ],
                  )
                ],
              ),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0.0,
            title: const Text('Профиль'),
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
            ),
          ),
          endDrawer: const MainMenu(),
          body: const LoadingScreen(),
        );
      },
    );
  }
}
