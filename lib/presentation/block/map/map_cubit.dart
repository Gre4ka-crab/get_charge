import 'package:bloc/bloc.dart';
import 'package:get_charge/domain/usecases/map_usecases.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  final GetTerminal getTerminalUseCases;
  final TakePowerBunk takePowerBunkUseCases;
  final ReturnPowerBunk returnPowerBunkUseCases;

  MapCubit({
    required this.getTerminalUseCases,
    required this.takePowerBunkUseCases,
    required this.returnPowerBunkUseCases,
  }) : super(MapInitial());

  getData() async {

  }

  takePowerBunk() async{

  }

  returnPowerBunk() async{

  }

  getTerminalsStream() async{

  }
  
}
