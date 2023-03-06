import 'package:dio/dio.dart';
import 'package:get_charge/core/api/api.dart';
import 'package:get_charge/data/models/order/order_view_model.dart';
import 'package:get_charge/data/models/order/oreder_model.dart';

abstract class RemoteOrderDataSources{
  Future<OrderModel> getOrder(String orderId);
  Future<List<OrderViewModel>> gerOrders();
}

class RemoteOrderDataSourcesImpl implements RemoteOrderDataSources{
  final Api api = Api();

  @override
  Future<List<OrderViewModel>> gerOrders() async{
    Response response = await api.get(query: 'order/GetOrders');
    return (response.data as List).map<OrderViewModel>((e) => OrderViewModel.formMap(e)).toList();
  }

  @override
  Future<OrderModel> getOrder(String orderId) async {
    Response response = await api.post(query: 'order/GetOrder', data: {'orderId': orderId});
    return OrderModel.fromJson(response.data);
  }


}