import 'package:dartz/dartz.dart';
import 'package:get_charge/core/error/failure.dart';

abstract class PowerBankRepository{
  Future<Either<Failure, void>> takePowerBank();
  Future<Either<Failure, void>> returnPowerBank();
}