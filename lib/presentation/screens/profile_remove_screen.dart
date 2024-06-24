import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_charge/presentation/block/profile/profile_cubit.dart';
import 'package:get_charge/presentation/screens/loading_screen.dart';
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
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (BuildContext context, state){
          if (state is ProfileExit) {
            Navigator.pushReplacementNamed(context, '/');
          }
        },
        builder: (BuildContext context, state){

          if(state is ProfileLoading){
            return const LoadingScreen();
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

          return Center(
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
                            callback: () => context.read<ProfileCubit>().removeAccount(context),
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
          );
        },
      ),
    );
  }
}
