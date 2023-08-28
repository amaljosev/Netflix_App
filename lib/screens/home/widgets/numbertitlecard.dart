import 'package:flutter/material.dart';

import '../../../core/font.dart';
import 'numbercard_widget.dart';

class NumberTitileCard extends StatelessWidget {
  const NumberTitileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Top 10 TV Shows in India Today", style: homeTitleStyle),
        LimitedBox(
          maxHeight: 150,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              10,
              (index) => NumberCard(
                index: index,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
