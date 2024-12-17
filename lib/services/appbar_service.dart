import 'dart:convert';
import 'package:http/http.dart';
import 'package:web_config/models/appbarResponse_model.dart';

class AppbarService {
  String _urlAppbar =
      'https://practicaparejas-e44d5-default-rtdb.europe-west1.firebasedatabase.app/appbar';

  Future<AppbarResponse> getAppbar() async {
    AppbarResponse titulo = AppbarResponse(titulo: '');
    Uri uri = Uri.parse('$_urlAppbar.json');
    Response response = await get(uri);
    Map<String, dynamic> firebase = jsonDecode(response.body);
    firebase.forEach((clave, valor) {
      AppbarResponse temp = AppbarResponse.fromJson(valor);
      temp.id = clave;
      titulo = temp;
    });
    return titulo;
  }

    Future<void> putAppbar(AppbarResponse appbar) async {
    Uri uri = Uri.parse('$_urlAppbar/${appbar.id}.json');
    final response = await put(
      uri,
      body: jsonEncode(appbar.toJson()),
    );
    print(response);
  }
}
