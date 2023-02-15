import 'package:get_charge/data/models/User/OrderView.dart';
import 'package:get_charge/domain/repository/order_repository.dart';

class OrderRepositoryTml implements OrderRepository{

  @override
  Future<OrderView?> getOrder(String orderId) {
    // TODO: implement getOrder
    throw UnimplementedError();
  }

  @override
  Future<List<OrderView>?> getOrders() {
    // TODO: implement getOrders
    throw UnimplementedError();
  }

  
}