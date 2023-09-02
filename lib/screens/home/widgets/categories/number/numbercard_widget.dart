import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';

import '../../../../../constants/colors/common_colors.dart';


class NumberCard extends StatelessWidget {
  const NumberCard({
    super.key,
    required this.index,
    required this.snapshot,
  });
  final int index;
  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 10,
          bottom: -30,
          child: BorderedText(
            strokeColor: titleColor,
            strokeWidth: 2.0,
            child: Text(
              "${index + 1}",
              style: const TextStyle(color: scaffoldColor, fontSize: 100),
            ),
          ),
        ),
        Row(
          children: [
            const SizedBox(
              width: 50,
              height: 150,
            ),
            Container(
              width: 100,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: Image.network(
                  '${Constants.imagePath}${snapshot.data[index].posterPath}', 
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
