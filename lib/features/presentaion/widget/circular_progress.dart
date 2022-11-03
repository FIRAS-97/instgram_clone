import 'package:flutter/material.dart';

class loadingProgress extends StatelessWidget {
  const loadingProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(30),
        child: Center(
          child: SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(
              color: Colors.amber,
            ),
          ),
        ));
  }
}
