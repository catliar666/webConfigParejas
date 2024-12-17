import 'package:flutter/material.dart';
import 'package:web_config/models/appbarResponse_model.dart';
import 'package:web_config/presentation/widgets/error_data_widget.dart';
import 'package:web_config/presentation/widgets/no_data_widget.dart';
import 'package:web_config/services/appbar_service.dart';

class AppbarScreen extends StatelessWidget {
  const AppbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Configuración de AppBar',
          ),
        ),
        body: const _AppbarView());
  }
}

class _AppbarView extends StatelessWidget {
  const _AppbarView({super.key});

  @override
  Widget build(BuildContext context) {
    AppbarService appbarService = AppbarService();
    Future<AppbarResponse> appbar = appbarService.getAppbar();
    return FutureBuilder<AppbarResponse>(
      future: appbar,
      builder: (BuildContext context, AsyncSnapshot<AppbarResponse> snapshot) {
        if (snapshot.hasData) {
          return ModificarAppbar(appbar: snapshot.data!, appbarService: appbarService);
        } else if (snapshot.hasError) {
          return const Center(child: ErrorDataWidget());
        } else {
          return const Center(child: NoDataWidget());
        }
      },
    );
  }
}

class ModificarAppbar extends StatefulWidget {
  final AppbarResponse appbar;
  final AppbarService appbarService;

  const ModificarAppbar({super.key, required this.appbar, required this.appbarService});

  @override
  State<ModificarAppbar> createState() => _ModificarAppbarState();
}

class _ModificarAppbarState extends State<ModificarAppbar> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [
        // Mostrar título actual
        Card(
          child: ListTile(
            title: const Text("Título actual"),
            subtitle: Text(widget.appbar.titulo),
          ),
        ),
        // Editar título
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Editar título del AppBar:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: widget.appbar.titulo,
                  decoration: const InputDecoration(labelText: "Nuevo título"),
                  onChanged: (value) => widget.appbar.titulo = value,
                ),
                const SizedBox(height: 10),
                FilledButton.icon(
                  onPressed: () {
                    widget.appbarService.putAppbar(widget.appbar);
                    setState(() {});
                  },
                  icon: const Icon(Icons.save),
                  label: const Text("Guardar cambios"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
