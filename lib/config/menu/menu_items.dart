import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final Icon icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Rutas',
      subTitle: 'Configuración de las rutas',
      link: '/rutas',
      icon: Icon(Icons.route, size: 50,)),
  MenuItem(
      title: 'AppBar',
      subTitle: 'Configuración del AppBar',
      link: '/appbar',
      icon: Icon(
        Icons.app_registration,
        size: 50,
      )),
  MenuItem(
      title: 'Theme',
      subTitle: 'Configuración del Theme',
      link: '/theme',
      icon: Icon(Icons.color_lens, size: 50,)),
  MenuItem(
      title: 'Config',
      subTitle: 'Configuración de la información',
      link: '/config',
      icon: Icon(Icons.adjust, size: 50,))
];
