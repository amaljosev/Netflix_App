import 'dart:math';

import 'package:flutter/cupertino.dart';

class DownloadImages extends StatelessWidget { 
  const DownloadImages({
    super.key,
    required this.imageList,
    required this.screenSizeWidth,
    required this.screenSizeHeight,
    required this.angle,
    required this.margin,
  });

  final String imageList;
  final double screenSizeWidth;
  final double screenSizeHeight;
  final double angle;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageList),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        width: screenSizeWidth,
        height: screenSizeHeight,
      ),
    );
  }
}


