import 'package:flutter/material.dart';
import 'package:get_charge/presentation/heplers.dart';
import 'package:get_charge/data/models/order/order_view_model.dart';
import 'package:get_charge/presentation/widget/loading/Loading.dart';
import 'package:intl/intl.dart';
import 'lease_detail_screen.dart';

class HistoryListScreen extends StatelessWidget {

  const HistoryListScreen({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30, left: 30, right: 30),
        child: FutureBuilder<List<OrderViewModel>?>(
          // future: Order.getOrders(),
          builder: (BuildContext _, AsyncSnapshot<List<OrderViewModel>?> snapshot) {
            if (!snapshot.hasData) {
              return const Loading();
            }

            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var order = snapshot.data![index];
                  String formatDate =
                  DateFormat('dd.MM.yyyy').format(order.date).toString();

                  return InkWell(
                      onTap: () =>
                          Helpers.displayDialog(
                              context, const LeaseDetailScreen(orderId: '',)),
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 9, left: 22, right: 11),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 247, 247, 247),
                            borderRadius: BorderRadius.all(Radius.circular(
                                15))),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          formatDate,
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color: Color.fromARGB(
                                                255, 134, 135, 137),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text('№ ${order.number.toString()}'),
                                        Text('${order.hours.toInt()}h'),
                                        Text('${order.price} на руб.'),
                                      ],
                                    ),
                                  ],
                                )),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Color.fromARGB(255, 0, 158, 240),
                              size: 10,
                            ),
                          ],
                        ),
                      ));
                });
          },),
      ),
    );
  }
}
