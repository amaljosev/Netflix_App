import 'package:flutter/material.dart';
import 'package:netflix/screens/search/widgets/search_field.dart';
import 'package:netflix/screens/search/widgets/search_tile.dart';

import '../../../core/colors/common_colors.dart';

class SearchIdle extends StatelessWidget {
  const SearchIdle({
    super.key,
    required this.newAndHotTempImage,
    required this.movieName,
  });

  final String newAndHotTempImage;
  final String movieName;

  @override
  Widget build(BuildContext context) {
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchField(),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text( 
            'Top Searches',
            style: TextStyle(
                color: titleColor, fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        SearchTile(newAndHotTempImage: newAndHotTempImage, movieName: movieName)
      ],
    );
  }
}

