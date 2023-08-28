import 'package:flutter/material.dart';

import '../../../core/font.dart';
import 'maincards.dart';

class MainTileCard extends StatelessWidget {
  const MainTileCard({
    super.key,
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: homeTitleStyle),
        LimitedBox(
          maxHeight: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => MainCard(image: image), 
            ),
          ),
        ),
      ],
    );
  }
}
