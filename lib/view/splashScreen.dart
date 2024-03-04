import 'package:flutter/material.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/memehub.png'),
              height: 300,
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}