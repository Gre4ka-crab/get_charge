import 'package:get_charge/services/AuthService.dart';
import 'package:http/http.dart' as https;

class ApiService {
  static String apiDomain = 'identity.ampi.joytech.store';

  static Future<https.Response> post({required String method, Object? body, Map<String, String>? headers}) async {
    return await https.post(Uri.https(apiDomain, method),
        body: body, headers: headers ?? {'Authorization': 'Bearer ${AuthService.token ?? ''}'});
  }

  static Future<https.Response> get({required String method, Map<String, String>? body, Map<String, String>? headers}) async {
    return await https.get(Uri.https(apiDomain, method, body),
        headers: headers ?? {'Authorization': 'Bearer ${AuthService.token ?? ''}'});
  }
}
