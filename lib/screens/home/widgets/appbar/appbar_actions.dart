import 'package:flutter/material.dart';
import '../../../../core/colors/common_colors.dart';

AppBar newMethod(String logo) {
    return AppBar(
        backgroundColor: Colors.black87, 
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 50,
              height: 50,
              decoration:  BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      logo,
                    ),
                    fit: BoxFit.fill),
              ),
            ),
          ),
          const Spacer(),
          const Icon(Icons.search),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: const BoxDecoration(
                  color: redCard,
                  borderRadius: BorderRadius.all(Radius.circular(2))),
              width: 22,
              height: 22,
            ),
          ),
        ],
      );
  }