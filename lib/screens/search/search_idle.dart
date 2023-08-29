import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SearchIdle extends StatelessWidget {
  const SearchIdle({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold( 
      body: SafeArea(
        child: Column(
          children: [
            CupertinoSearchTextField(
              padding:EdgeInsets.all(15) ,
              decoration: BoxDecoration(color:  Colors.grey.withOpacity(0.4), ),
              
              prefixIcon: const Icon(CupertinoIcons.search,color: Colors.grey,), 
                suffixIcon: Icon(CupertinoIcons.xmark_circle_fill,color: Colors.grey,) , 
              style: const TextStyle(color: Colors.grey),  
            ),
          ],
        ),
      ),
    );
  }
}