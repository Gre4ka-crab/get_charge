import 'package:get_charge/domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required super.id,
    required super.startTime,
    required super.endTime,
    required super.userId,
    required super.beginTerminalId,
    required super.endTerminalId,
    required super.tariffId,
    required super.paymentMethodId,
    required super.powerBandId,
    required super.statusId,
    required super.number,
    required super.price,
    required super.beginTerminal,
    required super.endTerminal,
    required super.powerBand,
  });
}
