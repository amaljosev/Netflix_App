import 'package:flutter/material.dart';

import '../../../core/font.dart';
import 'numbercard_widget.dart';

class NumberTitileCard extends StatelessWidget {
  const NumberTitileCard({
    super.key,
    required this.movieList,
    required this.getPosterPath,
  });
  final List<dynamic> movieList;
  final String Function(dynamic) getPosterPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Top 10 TV Shows in India Today", style: homeTitleStyle),
        LimitedBox(
            maxHeight: 150,
            child: ListView.builder(
              
              scrollDirection: Axis.horizontal,
            itemCount: movieList.length,
            itemBuilder: (context, index) {
              final movie = movieList[index];
              final posterPath = getPosterPath(movie);
              return NumberCard(index: index,posterPath: posterPath,); 
            },
            ),),
      ],
    );
  }
}
