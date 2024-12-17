import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Todavía no hay información',
            style: TextStyle(fontSize: 20, color: Colors.white)),
        SizedBox(
          height: 30,
        ),
        CircularProgressIndicator(color: Colors.white)
      ],
    );
  }
}
