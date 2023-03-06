part of 'order_cubit.dart';

abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderLoading extends OrderState {}


class OrderLoaded extends OrderState {
  final OrderEntity order;

  OrderLoaded({required this.order});
}

class OrderError extends OrderState {
  final Failure error;

  OrderError({required this.error});
}