import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_charge/core/api/api.dart';
import 'package:get_charge/domain/usecases/authorization_usecases.dart';
import 'package:get_charge/domain/usecases/order_usecases.dart';
import 'package:get_charge/domain/usecases/profile_usecases.dart';
import 'package:get_charge/presentation/block/auth/auth_cubit.dart';
import 'package:get_charge/presentation/block/order/order_cubit.dart';
import 'package:get_charge/presentation/block/orders%20history/orders_history_cubit.dart';
import 'package:get_charge/presentation/block/profile/profile_cubit.dart';
import 'package:get_charge/presentation/screens/auth_screen.dart';
import 'package:get_charge/presentation/screens/bonus_screen.dart';
import 'package:get_charge/presentation/screens/deposit_info_screen.dart';
import 'package:get_charge/presentation/screens/get_power_bank_info_screen.dart';
import 'package:get_charge/presentation/screens/pass_power_bank.dart';
import 'package:get_charge/presentation/screens/pass_power_bank_complete.dart';
import 'package:get_charge/presentation/screens/pass_power_bank_info.dart';
import 'package:get_charge/presentation/screens/pay_ments_screen.dart';
import 'package:get_charge/presentation/screens/profile_remove_screen.dart';
import 'package:get_charge/presentation/screens/qr_scan_screen.dart';
import 'package:get_charge/presentation/screens/terminal_selected.dart';
import 'package:get_charge/presentation/screens/user_profile_screen.dart';
import 'package:get_charge/presentation/screens/about_application_screen.dart';
import 'package:get_charge/presentation/widget/modal/get_bonus.dart';
import 'package:get_charge/presentation/screens/map_screeen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await [Permission.location].request();

  await Api.init(urls: {'identity': 'https://ampi-identity.joytech.store/', 'powerbank': 'https://ampi-powerbank.joytech.store/'});

  await ScreenUtil.ensureScreenSize();

  await di.init();

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
            providers: [
              BlocProvider<AuthCubit>(
                create: (_) => AuthCubit(getToken: sl<GetToken>(), refreshToken: sl<RefreshToken>()),
              ),
              BlocProvider<ProfileCubit>(
                create: (_) => ProfileCubit(getProfile: sl<GetProfile>()),
              ),
              BlocProvider<OrdersHistoryCubit>(
                create: (_) => OrdersHistoryCubit(getOrders: sl<GetOrders>()),
              ),
              BlocProvider<OrderCubit>(
                create: (_) => OrderCubit(getOrder: sl<GetOrder>()),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  centerTitle: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 158, 240)),
                  titleTextStyle: TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'gilroy'),
                ),
                fontFamily: 'gilroy',
              ),
              routes: {
                '/': (context) => const MapScreen(),
                '/auth/number': (context) => const AuthScreen(),
                // '/auth/number/confirm': (context) => const AuthNumberConfirm(),
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
      },
    ),
  );
}
