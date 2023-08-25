import 'package:flutter/material.dart';

import '../../core/colors/common_colors.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      backgroundColor: scaffoldColor,
      body: Center( 
        child: Text(
          'home',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
