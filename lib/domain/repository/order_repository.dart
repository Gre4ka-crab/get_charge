import 'package:get_charge/data/models/User/OrderView.dart';

abstract class OrderRepository{
  Future<List<OrderView>?> getOrders();
  Future<OrderView?> getOrder(String orderId);
}