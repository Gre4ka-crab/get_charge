import 'package:bloc/bloc.dart';
import 'package:get_charge/core/error/failure.dart';
import 'package:get_charge/core/usecase/usecase.dart';
import 'package:get_charge/domain/entities/order_view_entity.dart';
import 'package:get_charge/domain/usecases/order_usecases.dart';

part 'orders_history_state.dart';

class OrdersHistoryCubit extends Cubit<OrdersHistoryState> {
  final GetOrders getOrders;

  OrdersHistoryCubit({required this.getOrders}) : super(OrdersHistoryInitial());


   getData() async{
    emit(OrdersHistoryLoading());

    var result = await getOrders(NoParams());
    result.fold((error) => emit(OrdersHistoryError(error: error)), (result) => emit(OrdersHistoryLoaded(orders: result)));
  }
}
