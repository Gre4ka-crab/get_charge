import 'package:bloc/bloc.dart';
import 'package:get_charge/core/error/failure.dart';
import 'package:get_charge/domain/entities/order_entity.dart';
import 'package:get_charge/domain/usecases/order_usecases.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final GetOrder getOrder;
  OrderCubit({required this.getOrder}) : super(OrderInitial());


  getData(String orderId) async{
    emit(OrderLoading());

    var result = await getOrder(ParamsGetOrder(orderId: orderId));
    result.fold((error) => emit(OrderError(error: error)), (result) => emit(OrderLoaded(order: result)));
  }
}
