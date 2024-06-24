import 'package:dio/dio.dart';
import 'package:get_charge/core/api/api.dart';
import 'package:get_charge/data/models/order/terminal_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract class RemoteMapDataSources {
  Future<List<TerminalModel>> getTerminals();
  Stream<TerminalModel> getTerminalsStream();

  Future<void> takePowerBank();
  Future<void> returnPowerBank();
}

class RemoteMapDataSourcesImpl implements RemoteMapDataSources {
  final Api api = Api();

  @override
  Future<List<TerminalModel>> getTerminals() async {
    Response response = await api.get(query: 'Terminals/Get', urlsNane: 'powerBank', isAuth: false);
    return [TerminalModel.fromJson(response.data)];
  }

  @override
  Stream<TerminalModel> getTerminalsStream() {
    final channel = WebSocketChannel.connect(Uri.parse('wss://ampi-powerbank.joytech.store/powerbankhub'));

    return channel.stream.map<TerminalModel>((event) => TerminalModel.fromJson(event));
  }


  @override
  Future<void> returnPowerBank() async {
    await api.get(query: 'PowerBank/Take', urlsNane: 'powerBank', isAuth: false);
    return;
  }

  @override
  Future<void> takePowerBank() async {
    await api.get(query: 'PowerBank/Return', urlsNane: 'powerBank', isAuth: false);
    return;
  }
}
