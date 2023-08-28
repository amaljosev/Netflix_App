import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration:  BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: const BorderRadius.all(   
            Radius.circular(5), 
          ),
        ),
        width: 99,
        height: 150,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5)), 
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
