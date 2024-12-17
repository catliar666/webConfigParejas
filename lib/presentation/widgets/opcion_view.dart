import 'package:flutter/material.dart';

class OpcionView extends StatelessWidget {
  final String title;
  final String subtitle;
  final Icon icon;
  const OpcionView(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.12,
      ),
      icon,
      const SizedBox(
        height: 10,
      ),
      Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      Text(subtitle)
    ]);
  }
}
