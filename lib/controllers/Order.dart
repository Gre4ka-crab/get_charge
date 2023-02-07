import 'dart:convert';
import 'package:get_charge/data/api/api_service.dart';
import 'package:get_charge/data/models/User/OrderView.dart';
import 'package:http/http.dart';

class Order {
  static Future<List<OrderView>?> getOrders() async {
    Response response = await ApiService.get(method: 'order/GetOrders');
    Map<String, dynamic> map = json.decode(response.body);

    if (response.statusCode == 200) {
      return map
          .map((key, value) => MapEntry(key, OrderView.formMap(value)))
          .values
          .toList();
    }
    return null;
  }

  static Future<OrderView?> getOrder(String orderId) async {
    Response response = await ApiService.post(
        method: 'order/GetOrder', body: {'orderId': orderId.toString()});
    Map<String, dynamic> map = json.decode(response.body);
    if (response.statusCode == 200) {
      return OrderView.formMap(map);
    }
    return null;
  }
}
