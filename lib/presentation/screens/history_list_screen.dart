import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_charge/presentation/block/orders%20history/orders_history_cubit.dart';
import 'package:get_charge/presentation/heplers.dart';
import 'package:get_charge/presentation/screens/loading_screen.dart';
import 'package:intl/intl.dart';
import 'lease_detail_screen.dart';

class HistoryListScreen extends StatelessWidget {
  const HistoryListScreen({Key? key}) : super(key: key);

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
        child: BlocBuilder<OrdersHistoryCubit, OrdersHistoryState>(
          builder: (BuildContext context, state) {
            if (state is OrdersHistoryInitial) {
              context.read<OrdersHistoryCubit>().getData();
            }

            if (state is OrdersHistoryLoaded) {
              if(state.orders.isEmpty){
                return const Center(child: Text('Нет записей'));
              }
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.orders.length,
                  itemBuilder: (context, index) {
                    var order = state.orders[index];
                    String formatDate = DateFormat('dd.MM.yyyy').format(order.date ?? DateTime(2000)).toString();

                    return InkWell(
                        onTap: () => Helpers.displayDialog(context, LeaseDetailScreen(orderId: order.id ?? '')),
                        child: Container(
                          padding: const EdgeInsets.only(top: 10, bottom: 9, left: 22, right: 11),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 247, 247, 247), borderRadius: BorderRadius.all(Radius.circular(15))),
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
                                          color: Color.fromARGB(255, 134, 135, 137),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('№ ${order.number.toString()}'),
                                      Text('${order.hours}h'),
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
            }

            return const LoadingScreen();
          },
        ),
      ),
    );
  }
}
