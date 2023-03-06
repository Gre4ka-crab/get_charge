import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_charge/core/error/failure.dart';
import 'package:get_charge/core/network/network_info.dart';
import 'package:get_charge/data/datasources/remote_datasources/remote_order_datasorces.dart';
import 'package:get_charge/data/models/order/order_view_model.dart';
import 'package:get_charge/data/models/order/oreder_model.dart';
import 'package:get_charge/domain/repository/order_repository.dart';

class OrderRepositoryTmpl implements OrderRepository{
  final RemoteOrderDataSources remoteOrderDataSources;
  final NetworkInfo networkInfo;

  OrderRepositoryTmpl({required this.remoteOrderDataSources, required this.networkInfo});

  @override
  Future<Either<Failure, OrderModel>> getOrder(String orderId) async {
    var isConnected = await networkInfo.isConnected;
    if(isConnected){
      try {
        var response = await remoteOrderDataSources.getOrder(orderId);
        return Right(response);
      } on DioError catch (error) {
        return Left(ServerFailure(error.message.toString()));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderViewModel>>> getOrders() async {
    var isConnected = await networkInfo.isConnected;
    if(isConnected){
      try {
        var response = await remoteOrderDataSources.gerOrders();
        return Right(response);
      } on DioError catch (error) {
        return Left(ServerFailure(error.message.toString()));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  
}