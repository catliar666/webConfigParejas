import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_config/config/menu/menu_items.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      List<MenuItem> menuItems = appMenuItems;
      context.push('/home', extra: menuItems);
    });

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Indicador de carga
      ),
    );
  }
}
