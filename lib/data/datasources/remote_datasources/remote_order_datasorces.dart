import 'package:get_charge/data/models/order/order_view_model.dart';
import 'package:get_charge/data/models/order/oreder_model.dart';

abstract class RemoteProfileDataSources{
  Future<OrderModel> getOrder();
  Future<List<OrderViewModel>> gerOrders();
  Future<void> changeProfile(String email);
}

