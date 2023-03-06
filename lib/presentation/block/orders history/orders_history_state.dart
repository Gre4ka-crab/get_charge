part of 'orders_history_cubit.dart';

abstract class OrdersHistoryState {}

class OrdersHistoryInitial extends OrdersHistoryState {}

class OrdersHistoryLoading extends OrdersHistoryState {}

class OrdersHistoryLoaded extends OrdersHistoryState {
  final List<OrderViewEntity> orders;

  OrdersHistoryLoaded({required this.orders});
}

class OrdersHistoryError extends OrdersHistoryState {
  final Failure error;

  OrdersHistoryError({required this.error});
}