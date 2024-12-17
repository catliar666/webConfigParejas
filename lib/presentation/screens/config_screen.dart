import 'package:flutter/material.dart';
import 'package:web_config/models/configResponse_model.dart';
import 'package:web_config/presentation/widgets/error_data_widget.dart';
import 'package:web_config/presentation/widgets/no_data_widget.dart';
import 'package:web_config/services/config_service.dart';

class ConfigScreen extends StatelessWidget {
  const ConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Configuración de Config',
          ),
        ),
        body: const _ConfigView());
  }
}

class _ConfigView extends StatelessWidget {
  const _ConfigView({super.key});

  @override
  Widget build(BuildContext context) {
    ConfigService configService = ConfigService();
    Future<ConfigResponse> config = configService.getConfig();
    return FutureBuilder<ConfigResponse>(
      future: config,
      builder: (BuildContext context, AsyncSnapshot<ConfigResponse> snapshot) {
        if (snapshot.hasData) {
          return ModificarConfig(config: snapshot.data!, configService: configService);
        } else if (snapshot.hasError) {
          return const Center(child: ErrorDataWidget());
        } else {
          return const Center(child: NoDataWidget());
        }
      },
    );
  }
}

class ModificarConfig extends StatefulWidget {
  final ConfigResponse config;
  final ConfigService configService;

  const ModificarConfig({super.key, required this.config, required this.configService});

  @override
  State<ModificarConfig> createState() => _ModificarConfigState();
}

class _ModificarConfigState extends State<ModificarConfig> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        Card(
          child: ListTile(
            title: const Text("Autores actuales"),
            subtitle: Text(widget.config.autores),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Editar autores:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: widget.config.autores,
                  decoration: const InputDecoration(labelText: "Nuevos autores"),
                  onChanged: (value) => widget.config.autores = value,
                ),
              ],
            ),
          ),
        ),
        Card(
          child: ListTile(
            title: const Text("Curso actual"),
            subtitle: Text(widget.config.curso),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Editar curso:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: widget.config.curso,
                  decoration: const InputDecoration(labelText: "Nuevo curso"),
                  onChanged: (value) => widget.config.curso = value,
                ),
              ],
            ),
          ),
        ),
        Card(
          child: ListTile(
            title: const Text("Año actual"),
            subtitle: Text(widget.config.anio.toString()),
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Editar año:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: widget.config.anio.toString(),
                  decoration: const InputDecoration(labelText: "Nuevo año"),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => widget.config.anio = int.tryParse(value) ?? widget.config.anio,
                ),
              ],
            ),
          ),
        ),
        Card(
          child: SwitchListTile(
            title: const Text("¿Mostrar SplashScreen?"),
            value: widget.config.splashScreen,
            onChanged: (value) {
              setState(() {
                widget.config.splashScreen = value;
              });
            },
          ),
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FilledButton.icon(
              onPressed: () {
                widget.configService.putConfig(widget.config);
                setState(() {});
              },
              icon: const Icon(Icons.save),
              label: const Text("Guardar cambios"),
            ),
          ),
        ),
      ],
    );
  }
}
