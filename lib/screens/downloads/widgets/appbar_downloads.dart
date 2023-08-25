import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/colors/common_colors.dart';

class AppbarDownloads extends StatelessWidget {
  const AppbarDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Downloads',
              style: GoogleFonts.montserrat(
                  fontSize: 20, color: titleColor, fontWeight: FontWeight.w500),
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.search_sharp,
            color: titleColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),  
            child: Container(
              decoration: const BoxDecoration(
                  color: redCard,
                  borderRadius: BorderRadius.all(Radius.circular(2))),
              width: 22,
              height: 22,
            ),
          ),
        ],
      ),
    );
  }
}
