import 'package:get_charge/data/models/order/order_view_model.dart';
import 'package:get_charge/domain/repository/order_repository.dart';

class OrderRepositoryTml implements OrderRepository{

  @override
  Future<OrderViewModel?> getOrder(String orderId) {
    // TODO: implement getOrder
    throw UnimplementedError();
  }

  @override
  Future<List<OrderViewModel>?> getOrders() {
    // TODO: implement getOrders
    throw UnimplementedError();
  }

  
}