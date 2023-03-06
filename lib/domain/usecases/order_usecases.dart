import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:get_charge/core/error/failure.dart';
import 'package:get_charge/core/usecase/usecase.dart';
import 'package:get_charge/data/models/order/order_view_model.dart';
import 'package:get_charge/domain/entities/order_entity.dart';
import 'package:get_charge/domain/entities/order_view_entity.dart';
import 'package:get_charge/domain/repository/order_repository.dart';

class GetOrder implements UseCase<OrderEntity, ParamsGetOrder>{
  OrderRepository orderRepository;

  GetOrder({required this.orderRepository});

  @override
  Future<Either<Failure, OrderEntity>> call(ParamsGetOrder params) {
    return orderRepository.getOrder(params.orderId);
  }

}

class ParamsGetOrder extends Equatable {
  final String orderId;

  const ParamsGetOrder({required this.orderId});

  @override
  List<Object?> get props => [orderId];

  @override
  String toString() {
    return 'ParamsGetOrder{orderId: $orderId}';
  }
}

class GetOrders implements UseCase<List<OrderViewEntity>, NoParams>{
  OrderRepository orderRepository;

  GetOrders({required this.orderRepository});

  @override
  Future<Either<Failure, List<OrderViewModel>>> call(_) {
    return orderRepository.getOrders();
  }

}