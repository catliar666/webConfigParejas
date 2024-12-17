import 'dart:convert';
import 'package:http/http.dart';
import 'package:web_config/models/themeResponse_model.dart';

class ThemeService {
  String _urlTheme =
      'https://practicaparejas-e44d5-default-rtdb.europe-west1.firebasedatabase.app/theme';

  Future<ThemeResponse> getTheme() async {
    List<ThemeResponse> theme = [];
    Uri uri = Uri.parse('$_urlTheme.json');
    Response response = await get(uri);
    Map<String, dynamic> firebase = jsonDecode(response.body);
    print('Firebase: ');
    print(firebase);
    firebase.forEach((clave, valor) {
      print('Valor: ');
      print(valor);

      print('Clave: ');
      print(clave);

      ThemeResponse temp = ThemeResponse();

      temp.data = Data.fromJson(valor);
      temp.data!.id = clave;

      print('TEMP: ');
      print(temp.data!.color);

      theme.add(temp);
    });
    print(theme[0].data!.color);
    return theme[0];
  }

  Future<void> putTheme(ThemeResponse theme) async {
    Uri uri = Uri.parse('$_urlTheme/${theme.data!.id}.json');
    String json = '''{
"color": "${theme.data!.color}",
"oscuro": ${theme.data!.oscuro},
"tamanioLetra": ${theme.data!.tamanioLetra}
    }''';

    // print(json);
    await put(
      uri,
      body: json,
    );
    // print(response);
  }
}
