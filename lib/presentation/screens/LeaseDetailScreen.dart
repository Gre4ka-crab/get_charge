import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_charge/controllers/Order.dart';
import 'package:get_charge/data/models/Lease.dart';
import 'package:get_charge/presentation/widget/expantions/CustomExpansion.dart';
import 'package:get_charge/presentation/widget/loading/Loading.dart';

class LeaseDetailScreen extends StatelessWidget {
  final String orderId;
  const LeaseDetailScreen({Key? key, required this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isExpanded = ValueNotifier(false);
    ListTileThemeData themeData = const ListTileThemeData();



    return Scaffold(
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
        title: const Text('История аренд'),
      ),
      body: FutureBuilder(
        future: Order.getOrder(orderId),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

          if(!snapshot.hasData){
            return const Loading();
          }

          return Center();

          // return Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 30),
          //   child: Column(
          //     children: [
          //       Row(
          //         children: [
          //           Text(
          //             'Аренда № ${lease.id}',
          //             style: const TextStyle(
          //                 fontSize: 16, fontWeight: FontWeight.w700),
          //           )
          //         ],
          //       ),
          //       Row(
          //         children: [
          //           Text(
          //             'от 19 августа 2022 г.',
          //             style: const TextStyle(fontSize: 12),
          //           )
          //         ],
          //       ),
          //       const Padding(padding: EdgeInsets.only(bottom: 23)),
          //       Container(
          //         margin: const EdgeInsets.only(bottom: 8),
          //         padding: const EdgeInsets.only(bottom: 5),
          //         decoration: const BoxDecoration(
          //             border: Border(
          //               bottom: BorderSide(
          //                   color: Color.fromARGB(255, 226, 226, 226)),
          //             )),
          //         child: Row(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Expanded(
          //                 child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: const [Text('Тариф')])),
          //             Expanded(
          //                 child: Column(
          //                   children: [Text(lease.duration)],
          //                 )),
          //           ],
          //         ),
          //       ),
          //       Container(
          //         margin: const EdgeInsets.only(bottom: 8),
          //         padding: const EdgeInsets.only(bottom: 5),
          //         decoration: const BoxDecoration(
          //             border: Border(
          //                 bottom: BorderSide(
          //                     color: Color.fromARGB(255, 226, 226, 226)))),
          //         child: Row(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Expanded(
          //                 child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: const [Text('Продолжительность')])),
          //             Expanded(
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [Text(lease.rate)],
          //                 )),
          //           ],
          //         ),
          //       ),
          //       Container(
          //         margin: const EdgeInsets.only(bottom: 8),
          //         padding: const EdgeInsets.only(bottom: 5),
          //         decoration: const BoxDecoration(
          //             border: Border(
          //                 bottom: BorderSide(
          //                     color: Color.fromARGB(255, 226, 226, 226)))),
          //         child: Row(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Expanded(
          //                 child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: const [Text('Стоимость')])),
          //             Expanded(
          //                 child: Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   children: [
          //                     Text(
          //                       '${lease.price} ₽',
          //                       style: const TextStyle(
          //                           fontWeight: FontWeight.w600),
          //                     ),
          //                   ],
          //                 )),
          //           ],
          //         ),
          //       ),
          //       ListTileTheme(
          //         contentPadding: EdgeInsets.zero,
          //         minVerticalPadding: 0,
          //         dense: true,
          //         horizontalTitleGap: 0,
          //         minLeadingWidth: 0,
          //         child: CustomExpansion(
          //           trailing: const Padding(padding: EdgeInsets.zero),
          //           tilePadding: EdgeInsets.zero,
          //           childrenPadding: EdgeInsets.zero,
          //           onExpansionChanged: (bool value) =>
          //           isExpanded.value = !isExpanded.value,
          //           title: Wrap(
          //             crossAxisAlignment: WrapCrossAlignment.center,
          //             children: [
          //               const Text(
          //                 'Детализация аренды',
          //                 style: TextStyle(
          //                     fontWeight: FontWeight.w500,
          //                     color: Color.fromARGB(255, 0, 158, 240)),
          //               ),
          //               const Padding(padding: EdgeInsets.only(left: 9)),
          //               ValueListenableBuilder(
          //                   valueListenable: isExpanded,
          //                   builder:
          //                       (BuildContext context, bool state,
          //                       Widget? child) {
          //                     return isExpanded.value
          //                         ? const Icon(
          //                         Icons.keyboard_arrow_right, size: 10)
          //                         : const Icon(
          //                         Icons.keyboard_arrow_down, size: 10);
          //                   })
          //             ],
          //           ),
          //           children: [
          //             ListView.builder(
          //               shrinkWrap: true,
          //               itemCount: lease.detail?.length ?? 0,
          //               itemBuilder: (BuildContext context, int index) {
          //                 LeaseDetail detail = lease.detail![index];
          //                 return Container(
          //                   decoration: const BoxDecoration(
          //                       color: Color.fromARGB(255, 247, 247, 247),
          //                       borderRadius:
          //                       BorderRadius.all(Radius.circular(15))),
          //                   margin: const EdgeInsets.only(bottom: 11),
          //                   constraints: const BoxConstraints(maxHeight: 260),
          //                   child: Column(
          //                     mainAxisSize: MainAxisSize.min,
          //                     children: [
          //                       Container(
          //                         padding: const EdgeInsets.only(
          //                           bottom: 10,
          //                           top: 12,
          //                           left: 17,
          //                           right: 50,
          //                         ),
          //                         child: Row(
          //                           children: [
          //                             Expanded(
          //                                 child: Column(
          //                                   crossAxisAlignment:
          //                                   CrossAxisAlignment.start,
          //                                   children: const [
          //                                     Text(
          //                                       'Дата и время старта',
          //                                       style: TextStyle(
          //                                           fontSize: 10,
          //                                           color: Color.fromARGB(
          //                                               255, 134, 135, 137)),
          //                                     ),
          //                                     Text(
          //                                       '26.08.2022, 21:28',
          //                                       style: TextStyle(
          //                                           fontSize: 12,
          //                                           fontWeight: FontWeight
          //                                               .w600),
          //                                     )
          //                                   ],
          //                                 )),
          //                             Expanded(
          //                                 child: Column(
          //                                   children: const [
          //                                     Text(
          //                                       '№ автомата',
          //                                       style: TextStyle(
          //                                           fontSize: 10,
          //                                           color: Color.fromARGB(
          //                                               255, 134, 135, 137)),
          //                                     ),
          //                                     Text(
          //                                       '6107',
          //                                       style: TextStyle(
          //                                           fontSize: 12,
          //                                           fontWeight: FontWeight
          //                                               .w600),
          //                                     ),
          //                                   ],
          //                                 )),
          //                           ],
          //                         ),
          //                       ),
          //                       Container(
          //                           height: 1,
          //                           color:
          //                           const Color.fromARGB(255, 226, 226, 226)),
          //                       Container(
          //                         padding: const EdgeInsets.only(
          //                           bottom: 10,
          //                           top: 12,
          //                           left: 17,
          //                           right: 50,
          //                         ),
          //                         child: Row(
          //                           children: [
          //                             Expanded(
          //                                 child: Column(
          //                                   crossAxisAlignment:
          //                                   CrossAxisAlignment.start,
          //                                   children: const [
          //                                     Text(
          //                                       'ул. Охотный ряд, д.2 ',
          //                                       style: TextStyle(fontSize: 10),
          //                                     ),
          //                                     Text(
          //                                       'Goodman, 2-й этаж',
          //                                       style: TextStyle(
          //                                           fontSize: 12,
          //                                           fontWeight: FontWeight
          //                                               .w600),
          //                                     )
          //                                   ],
          //                                 )),
          //                           ],
          //                         ),
          //                       )
          //                     ],
          //                   ),
          //                 );
          //               },
          //             ),
          //           ],
          //         ),
          //       ),
          //       const Padding(padding: EdgeInsets.only(top: 30)),
          //       Expanded(
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Wrap(
          //                 children: const [
          //                   Text(
          //                     'История транзакций',
          //                     style:
          //                     TextStyle(
          //                         fontSize: 16, fontWeight: FontWeight.w700),
          //                   )
          //                 ],
          //               ),
          //               Container(
          //                 height: 1,
          //                 color: const Color.fromARGB(255, 226, 226, 226,),
          //                 margin: const EdgeInsets.symmetric(vertical: 11),
          //               ),
          //               Expanded(
          //                   child: ListView.builder(
          //                     itemCount: lease.history?.length ?? 0,
          //                     itemBuilder: (BuildContext context, int index) {
          //                       TransactionHistory item = lease.history![index];
          //                       return Row(
          //                         mainAxisAlignment: MainAxisAlignment
          //                             .spaceBetween,
          //                         children: [
          //                           Text('№ ${item.id}'),
          //                           Text('${item.price} ₽'),
          //                           SvgPicture.asset('images/checkPrice.svg')
          //                         ],
          //                       );
          //                     },
          //                   ))
          //             ],
          //           ))
          //     ],
          //   ),
          // )
        },),
    );
  }
}
