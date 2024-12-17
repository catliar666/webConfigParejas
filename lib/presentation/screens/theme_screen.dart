
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:web_config/models/themeResponse_model.dart';
import 'package:web_config/presentation/widgets/error_data_widget.dart';
import 'package:web_config/presentation/widgets/no_data_widget.dart';
import 'package:web_config/services/theme_service.dart';


class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Configuración del tema',
          ),
        ),
        body: const _ThemeView());
  }
}

class _ThemeView extends StatelessWidget {
  const _ThemeView({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeService themeService = ThemeService();
    Future<ThemeResponse> theme = themeService.getTheme();
    return Scaffold(
        body: Container(
            child: FutureBuilder<ThemeResponse>(
                future: theme,
                builder: (BuildContext context,
                    AsyncSnapshot<ThemeResponse> snapshot) {
                  if (snapshot.hasData) {
                    return ModificarTheme(
                        theme: snapshot.data!, themeService: themeService);
                  } else if (snapshot.hasError) {
                    return const Center(child: ErrorDataWidget());
                  } else {
                    return const Center(child: NoDataWidget());
                  }
                })));
  }
}

class ModificarTheme extends StatefulWidget {
  final ThemeResponse theme;
  final ThemeService themeService;
  const ModificarTheme(
      {super.key, required this.theme, required this.themeService});

  @override
  State<ModificarTheme> createState() => _ModificarThemeState();
}

class _ModificarThemeState extends State<ModificarTheme> {
  ThemeResponse themeModificado = ThemeResponse();

  @override
  void initState() {
    super.initState();
    themeModificado = widget.theme;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Paleta de colores
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: width * 0.9,
                height: height * 0.1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey, width: 0.4), // Borde como separador
                    borderRadius: BorderRadius.circular(
                        50), // Opcional: bordes redondeados
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Color del tema'),
                      const SizedBox(width: 20),
                      IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      title: const Text('Elige un color'),
                                      content: SingleChildScrollView(
                                        child: ColorPicker(
                                            color: Color(int.parse(
                                                "0x${themeModificado.data!.color!}")),
                                            onColorChanged: changeColor),
                                      ),
                                    ));
                          },
                          icon: const Icon(Icons.color_lens)),
                    ],
                  ),
                ),
              ),
            ),

            // Tema oscuro
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: width * 0.9,
                height: height * 0.1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey, width: 0.4), // Borde como separador
                    borderRadius: BorderRadius.circular(
                        50), // Opcional: bordes redondeados
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Tema Oscuro'),
                      const SizedBox(width: 20),
                      Transform.scale(
                        scale: 1.5,
                        child: Switch(
                          value: themeModificado.data!.oscuro!,
                          onChanged: (bool newValue) {
                            themeModificado.data!.oscuro = newValue;
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Tamaño de letra
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: width * 0.9,
                height: height * 0.1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey, width: 0.4), // Borde como separador
                    borderRadius: BorderRadius.circular(
                        50), // Opcional: bordes redondeados
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Tamaño de la letra'),
                      const SizedBox(width: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                themeModificado.data!.tamanioLetra =
                                    themeModificado.data!.tamanioLetra! - 1;
                              });
                            },
                          ),
                          Text('${themeModificado.data!.tamanioLetra!}'),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                themeModificado.data!.tamanioLetra =
                                    themeModificado.data!.tamanioLetra! + 1;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            // Botón guardar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: width * 0.9,
                height: height * 0.1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey, width: 0.4), // Borde como separador
                    borderRadius: BorderRadius.circular(
                        50), // Opcional: bordes redondeados
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Aquí puedes agregar la lógica para guardar el tema modificado

                          widget.themeService.putTheme(themeModificado);

                          Navigator.pop(context);
                        },
                        child: const Text('Guardar'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changeColor(Color value) {
    setState(() {
      themeModificado.data!.color =
          '0${value.value.toRadixString(16).padLeft(8, '0')}';
    });
  }
}
