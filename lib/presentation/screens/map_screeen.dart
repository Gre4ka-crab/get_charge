import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_charge/presentation/heplers.dart';
import 'package:get_charge/presentation/widget/main_map.dart';
import 'package:get_charge/presentation/widget/buttonBar/SelectedPowerBank.dart';
import 'package:get_charge/presentation/widget/buttons/appBarButton.dart';
import 'package:get_charge/presentation/widget/main_menu.dart';
import 'package:get_charge/presentation/widget/modal/push_query.dart';
import '../widget/buttonBar/NoSelectedPowerBank.dart';
import '../widget/dropLists/FiltersList.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final ValueNotifier<bool> _isVisibleStar = ValueNotifier(true);
  final ValueNotifier<Map<String, bool?>> _filters = ValueNotifier({
    'Фильтр': null,
    'Работают сейчас': false,
    'Сдать повербанк': false,
  });
  final bool selectedPowerBank = false;

  _displayDialog(BuildContext context) {
    _isVisibleStar.value = false;
    showDialog<String>(
      context: context,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) => Dialog(
        insetPadding: EdgeInsets.only(right: 30.w, left: 30.w, top: MediaQuery.of(context).size.height / 8),
        backgroundColor: Colors.transparent,
        elevation: 0,
        alignment: Alignment.topCenter,
        child: FiltersList(filters: _filters),
      ),
    ).then((val) {
      _isVisibleStar.value = true;
    });
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      Helpers.openModal(context, const PushQuery());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      key: _scaffoldKey,
      drawer: const MainMenu(),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            const MainMap(),
            Padding(
              padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 30.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppBarButton(
                          icon: const Icon(Icons.menu, color: Color.fromARGB(255, 0, 158, 240)),
                          onPressed: () => _scaffoldKey.currentState?.openDrawer()),
                      AppBarButton(
                          icon: SvgPicture.asset('images/settings.svg'),
                          onPressed: () {
                            _displayDialog(context);
                          }),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ValueListenableBuilder(
                        valueListenable: _isVisibleStar,
                        builder: (BuildContext context, bool starVisible, Widget? child) {
                          return starVisible ? child! : const Padding(padding: EdgeInsets.zero);
                        },
                        child: AppBarButton(
                            margin: EdgeInsets.only(top: 6.h),
                            icon: SvgPicture.asset('images/goldStar.svg'),
                            onPressed: () {}),
                      ),
                    ],
                  )
                ],
              ),
            ),
            selectedPowerBank ? const SelectedPowerBank() : const NoSelectedPowerBank()
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _isVisibleStar.dispose();
    _filters.dispose();
    super.dispose();
  }
}
