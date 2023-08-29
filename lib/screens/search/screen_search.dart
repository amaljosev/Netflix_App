import 'package:flutter/material.dart';
import 'package:netflix/screens/home/widgets/appbar/appbar_actions.dart';
import 'package:netflix/screens/search/search_idle.dart';

import '../../core/colors/common_colors.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.black87, 
          actions: [
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                  color: redCard,
                  borderRadius: BorderRadius.all(Radius.circular(2))),
              width: 22,
              height: 22,
            ),
          ),]),
        body: SearchIdle()),
    );  
    
  }
}