import 'package:dartz/dartz.dart';
import 'package:get_charge/core/error/failure.dart';
import 'package:get_charge/core/usecase/usecase.dart';
import 'package:get_charge/domain/entities/terminal_entity.dart';
import 'package:get_charge/domain/repository/power_bank_repository.dart';
import 'package:get_charge/domain/repository/terminal_retository.dart';

class GetTerminal implements UseCase<List<TerminalEntity>, NoParams>{
  TerminalRepository terminalRepository;

  GetTerminal({required this.terminalRepository});

  @override
  Future<Either<Failure, List<TerminalEntity>>> call(NoParams noParams) {
    return terminalRepository.getTerminals();
  }
}


class TakePowerBunk implements UseCase<void, NoParams>{
  PowerBankRepository powerBankRepository;

  TakePowerBunk({required this.powerBankRepository});

  @override
  Future<Either<Failure, void>> call(NoParams noParams) {
    return powerBankRepository.takePowerBank();
  }
}

class ReturnPowerBunk implements UseCase<void, NoParams>{
  PowerBankRepository powerBankRepository;

  ReturnPowerBunk({required this.powerBankRepository});

  @override
  Future<Either<Failure, void>> call(NoParams noParams) {
    return powerBankRepository.returnPowerBank();
  }
}