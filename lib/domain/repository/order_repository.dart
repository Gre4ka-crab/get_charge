import 'package:dartz/dartz.dart';
import 'package:get_charge/core/error/failure.dart';
import 'package:get_charge/data/models/order/order_view_model.dart';
import 'package:get_charge/data/models/order/oreder_model.dart';

abstract class OrderRepository{
  Future<Either<Failure, List<OrderViewModel>>> getOrders();
  Future<Either<Failure, OrderModel>> getOrder(String orderId);
}