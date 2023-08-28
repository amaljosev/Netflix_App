
import 'package:flutter/material.dart';

import '../../../core/colors/common_colors.dart';

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({
    super.key,
    required this.mainImage,
  });

  final String mainImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 500,
            decoration: BoxDecoration(
              color: Colors.grey.shade900, 
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(mainImage),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(titleColor),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 45),
                      child: Text(
                        'Play',
                        style: TextStyle(
                            color: scaffoldColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                TextButton.icon(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white30),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                  label: const Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Text(
                      'My List',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
