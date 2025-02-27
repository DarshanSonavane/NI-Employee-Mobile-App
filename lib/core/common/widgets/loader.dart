import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/gif_image/loader.gif',
        height: 80,
        width: 80,
      ),
    );
  }
}
