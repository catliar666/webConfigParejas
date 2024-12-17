import 'package:flutter/material.dart';

class ErrorDataWidget extends StatelessWidget {
  const ErrorDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Ha ocurrido un error al traer la información',
            style: TextStyle(fontSize: 20, color: Colors.black)),
        SizedBox(
          height: 30,
        ),
        Icon(
          Icons.cancel, 
          color: Colors.red,
          size: 50,
        )
      ],
    );
  }
}
