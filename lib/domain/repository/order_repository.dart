import 'package:get_charge/data/models/order/order_view_model.dart';

abstract class OrderRepository{
  Future<List<OrderViewModel>?> getOrders();
  Future<OrderViewModel?> getOrder(String orderId);
}