import 'package:flutter/material.dart';
import 'package:web_config/models/rutasResponse_model.dart';
import 'package:web_config/presentation/widgets/error_data_widget.dart';
import 'package:web_config/presentation/widgets/no_data_widget.dart';
import 'package:web_config/services/rutas_service.dart';

class RutasScreen extends StatelessWidget {
  const RutasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Configuración de las rutas',
          ),
        ),
        body: _RutasView());
  }
}

class _RutasView extends StatelessWidget {
  const _RutasView({super.key});

  @override
  Widget build(BuildContext context) {
    RutasService rutasService = RutasService();
    Future<List<RutasResponse>> rutas = rutasService.getRutas();
    return Scaffold(
        body: Container(
      child: FutureBuilder<List<RutasResponse>>(
        future: rutas,
        builder: (BuildContext context,
            AsyncSnapshot<List<RutasResponse>> snapshot) {
          if (snapshot.hasData) {
            return ModificarRutas(rutas: snapshot.data!);
          } else if (snapshot.hasError) {
            return const Center(child: ErrorDataWidget());
          } else {
            return const Center(child: NoDataWidget());
          }
        },
      ),
    ));
  }
}

class ModificarRutas extends StatefulWidget {
  final List<RutasResponse> rutas;
  const ModificarRutas({super.key, required this.rutas});

  @override
  State<ModificarRutas> createState() => _ModificarRutasState();
}

class _ModificarRutasState extends State<ModificarRutas> {
  @override
  Widget build(BuildContext context) {
    RutasService rutasService = RutasService();
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //Especifica las columnas que se deben de crear
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 2.5,
        ),
        itemCount: widget.rutas.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey, width: 0.4), // Borde como separador
                borderRadius:
                    BorderRadius.circular(50), // Opcional: bordes redondeados
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Ruta ${(index + 1)} - ${widget.rutas[index].nombre}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width < 600
                              ? 24.0
                              : 28.0)),
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.width < 600 ? 14.0 : 18.0,
                  ),
                  Text(
                      'Para activar o desactivar una ruta, por favor pulse en el deslizable',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width < 600
                              ? 13.0
                              : 15.0)),
                  SizedBox(
                    height:
                        MediaQuery.of(context).size.width < 600 ? 14.0 : 18.0,
                  ),
                  Transform.scale(
                    scale: 1.5,
                    child: Switch(
                      value: widget.rutas[index].activo,
                      onChanged: (bool newValue) {
                        widget.rutas[index].activo = newValue;
                        rutasService.putRuta(widget.rutas[index]);
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
