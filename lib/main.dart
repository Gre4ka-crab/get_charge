import 'package:eticon_api/eticon_api.dart';
import 'package:flutter/material.dart';
import 'package:get_charge/presentation/screens/AuthNumberConfirm.dart';
import 'package:get_charge/presentation/screens/AuthScreen.dart';
import 'package:get_charge/presentation/screens/BonusScreen.dart';
import 'package:get_charge/presentation/screens/DepositInfoScreen.dart';
import 'package:get_charge/presentation/screens/GetPowerBankInfoScreen.dart';
import 'package:get_charge/presentation/screens/PassPowerBank.dart';
import 'package:get_charge/presentation/screens/PassPowerBankComplete.dart';
import 'package:get_charge/presentation/screens/PassPowerBankInfo.dart';
import 'package:get_charge/presentation/screens/PayMentsScreen.dart';
import 'package:get_charge/presentation/screens/ProfileRemoveScreen.dart';
import 'package:get_charge/presentation/screens/QrScanScreen.dart';
import 'package:get_charge/presentation/screens/TerminalSelected.dart';
import 'package:get_charge/presentation/screens/UserProfileScreen.dart';
import 'package:get_charge/presentation/screens/aboutApplicationScreen.dart';
import 'package:get_charge/services/AuthService.dart';
import 'package:get_charge/presentation/widget/modal/GetBonus.dart';
import 'package:get_charge/presentation/screens/MapScreeen.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await [Permission.location].request();

  await Api.init(urls: ['identity.ampi.joytech.store']);

  // await AuthService.readTokenInStorage();
  // if(AuthService.token == null){
  //   try{
  //     await AuthService.setToken('+79173010064', '1111');
  //   }catch(error){
  //     debugPrint('Ошибка $error');
  //   }
  // }

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 158, 240)),
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 18, fontFamily: 'gilroy')),
      fontFamily: 'gilroy',
    ),
    routes: {
      '/': (context) => const MapScreen(),
      '/auth/number': (context) => const AuthScreen(),
      '/auth/number/confirm': (context) => const AuthNumberConfirm(),
      '/terminalSelected': (context) => const TerminalSelected(),
      '/qrScan': (context) => const QrScanScreen(),
      '/userProfile': (context) => const UserProfileScreen(),
      '/aboutApplication': (context) => const AboutApplicationScreen(),
      '/bonus': (context) => const BonusScreen(),
      '/modalGetBonus': (context) => const GetBonus(),
      '/passPowerBank': (context) => const PassPowerBank(),
      '/passPowerBankInfo': (context) => const PassPowerBankInfo(),
      '/passPowerBankComplete': (context) => const PassPowerBankComplete(),
      '/profileRemove': (context) => const ProfileRemoveScreen(),
      '/payMents': (context) => const PayMentsScreen(),
      '/depositInfoScreen': (context) => const DepositInfoScreen(),
      '/getPowerBankInfo': (context) => const GetPowerBankInfoScreen(),
    },
  ));
}
