import 'package:flutter/material.dart';
import '../../../../../constants/font.dart';
import 'numbercard_widget.dart';

class NumberTitileCard extends StatelessWidget {
  const NumberTitileCard({
    super.key,
    required this.text,
    required this.snapshot,
  });
  final String text;
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(text, style: homeTitleStyle),
        ),
        LimitedBox(
          maxHeight: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return NumberCard(
                index: index,
                snapshot: snapshot,
              );
            },
          ),
        ),
      ],
    );
  }
}
