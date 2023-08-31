import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/screens/search/screen_search.dart';
import '../../../../core/colors/common_colors.dart';

AppBar appBar(String logo,context) {
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
           IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ScreenSearch(),),); 
           }, icon: const Icon(CupertinoIcons.search)), 
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