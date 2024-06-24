import 'package:dartz/dartz.dart';
import 'package:get_charge/core/error/failure.dart';
import 'package:get_charge/domain/entities/terminal_entity.dart';
import 'package:get_charge/domain/repository/terminal_retository.dart';

class TerminalRepositoryImpl implements TerminalRepository{

  @override
  Future<Either<Failure, Stream<TerminalEntity>>> connectTerminalsHub() {
    // TODO: implement connectTerminalsHub
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<TerminalEntity>>> getTerminals() {
    // TODO: implement getTerminals
    throw UnimplementedError();
  }

}