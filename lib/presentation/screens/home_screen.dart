import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_config/config/menu/menu_items.dart';
import 'package:web_config/presentation/widgets/opcion_view.dart';

class HomeScreen extends StatelessWidget {
  final List<MenuItem> menuOptions;
  const HomeScreen({super.key, required this.menuOptions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //Desactiva la flecha de volver atras
        centerTitle: true,
        title: const Text(
          'Configuración General de la APP',
        ),
      ),
      body: _HomeView(menuOptions),
      bottomNavigationBar: const BottomAppBar(
        color: Color.fromARGB(0, 226, 220, 220),
        child: Center(
          child: Text('Hecha por María Ordóñez'),
        ),
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  final List<MenuItem> menuOptions;
  const _HomeView(this.menuOptions);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        //Se utiliza para mostrar los widgets en formato rejilla
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, //Especifica las columnas que se deben de crear
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 2.5,
        ),
        itemCount: menuOptions.length,
        itemBuilder: (context, index) {
          final MenuItem item = menuOptions[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: IconButton(
              onPressed: () {
                context.push(item.link);
              },
              icon: OpcionView(
                  title: item.title, subtitle: item.subTitle, icon: item.icon),
            ),
          );
        });
  }
}
