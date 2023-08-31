import 'package:flutter/material.dart';
import '../../../core/api.dart';
import '../../../core/colors/common_colors.dart'; 

class MainTileCard extends StatelessWidget {
  const MainTileCard({
    Key? key,
    required this.title,
    required this.movieList,
    required this.getPosterPath,
  }) : super(key: key);

  final String title;
  final List<dynamic> movieList;
  final String Function(dynamic) getPosterPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: titleColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 150, 
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movieList.length,
            itemBuilder: (context, index) {
              final movie = movieList[index];
              final posterPath = getPosterPath(movie);

              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    address+posterPath, 
                    width: 100,
                    height: 150, 
                    fit: BoxFit.cover,
                  ), 
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}