import 'dart:convert';
import 'package:http/http.dart';
import 'package:web_config/models/rutasResponse_model.dart';

class RutasService {
  String _urlRutas =
      'https://practicaparejas-e44d5-default-rtdb.europe-west1.firebasedatabase.app/rutas';

  Future<List<RutasResponse>> getRutas() async {
    List<RutasResponse> rutas = [];
    Uri uri = Uri.parse('$_urlRutas.json');
    Response response = await get(uri);
    Map<String, dynamic> firebase = jsonDecode(response.body);
    // print(firebase);
    firebase.forEach((clave, valor) {
      RutasResponse temp = RutasResponse.fromJson(valor);
      temp.id = clave;
      rutas.add(temp);
    });
    return rutas;
  }

  Future<void> putRuta(RutasResponse ruta) async {
    Uri uri = Uri.parse('$_urlRutas/${ruta.id}.json');
    final response = await put(
      uri,
      body: jsonEncode(ruta.toJson()),
    );
    print(response);
  }
}
