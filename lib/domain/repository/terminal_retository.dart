import 'package:dartz/dartz.dart';
import 'package:get_charge/core/error/failure.dart';
import 'package:get_charge/domain/entities/terminal_entity.dart';

abstract class TerminalRepository{
  Future<Either<Failure, List<TerminalEntity>>> getTerminals();
  Future<Either<Failure, Stream<TerminalEntity>>> connectTerminalsHub();
}