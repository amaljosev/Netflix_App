import 'package:flutter/material.dart';

import '../../../core/colors/common_colors.dart';

class SearchTile extends StatelessWidget {
  const SearchTile({
    super.key,
    required this.newAndHotTempImage,
    required this.movieName,
  });

  final String newAndHotTempImage;
  final String movieName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          shrinkWrap: true, 
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Container(
                    height: 80,
                    width: 120,
                    decoration:  BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)), 
                      image: DecorationImage(
                          image: NetworkImage(newAndHotTempImage),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(movieName,style: const TextStyle(color: titleColor,fontSize: 15),),
                  ),
                  const Spacer(),
                  const CircleAvatar(child: CircleAvatar(radius: 19  ,backgroundColor: Colors.black , child: Icon(Icons.play_arrow,color: titleColor,)))  
                ],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
            itemCount: 10),
      ),
    );
  }
}