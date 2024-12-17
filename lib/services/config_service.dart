import 'dart:convert';
import 'package:http/http.dart';
import 'package:web_config/models/configResponse_model.dart';

class ConfigService {
  String _urlConfig =
      'https://practicaparejas-e44d5-default-rtdb.europe-west1.firebasedatabase.app/config';

  Future<ConfigResponse> getConfig() async {
    ConfigResponse config =
        ConfigResponse(anio: 2024, autores: '', curso: '', splashScreen: true);
    Uri uri = Uri.parse('$_urlConfig.json');
    Response response = await get(uri);
    Map<String, dynamic> firebase = jsonDecode(response.body);
    firebase.forEach((clave, valor) {
      ConfigResponse temp = ConfigResponse.fromJson(valor);
      temp.id = clave;
      config = temp;
    });
    return config;
  }

  Future<void> putConfig(ConfigResponse config) async {
    Uri uri = Uri.parse('$_urlConfig/${config.id}.json');
    final response = await put(
      uri,
      body: jsonEncode(config.toJson()),
    );
    print(response);
  }
}
