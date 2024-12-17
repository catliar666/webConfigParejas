import 'package:flutter/material.dart';
import 'package:web_config/config/router/app_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Configuración Aplicación',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,);
  }
}