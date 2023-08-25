import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/common_colors.dart';

import 'center_images/download_images.dart';

class BodyDownloads extends StatelessWidget {
  BodyDownloads({super.key});

  final List<String> imageList = [
    "https://www.themoviedb.org/t/p/w220_and_h330_face/eyWICPcxOuTcDDDbTMOZawoOn8d.jpg",
    "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg",
    "https://www.themoviedb.org/t/p/w220_and_h330_face/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ListView( 
      children: [
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Icon(
                Icons.settings,
                color: textColor,
              ),
            ),
            Text(
              'Smart Downloads',
              style: GoogleFonts.montserrat(
                  fontSize: 13, color: textColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Turn on Downloads for You',
                  style: GoogleFonts.montserrat(
                      fontSize: 18,
                      color: titleColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'We will download movies and shows just for you,so you will always  have something to watch.',
                  style: GoogleFonts.montserrat(
                      fontSize: 13,
                      color: textColor,
                      fontWeight: FontWeight.bold), 
                ),
              ),
              Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey.shade900,  
                        radius: screenSize.width * 0.34,
                      ),
                      DownloadImages(
                        imageList: imageList[0],
                        screenSizeWidth: screenSize.width * 0.30,
                        screenSizeHeight: screenSize.height * 0.26,
                        angle: 20,
                        margin:
                            const EdgeInsets.only(left: 200, bottom: 35),
                      ),
                      DownloadImages(
                        imageList: imageList[1],
                        screenSizeWidth: screenSize.width * 0.30,
                        screenSizeHeight: screenSize.height * 0.26,
                        angle: -20,
                        margin:
                            const EdgeInsets.only(right: 200, bottom: 35),
                      ),
                      DownloadImages(
                        imageList: imageList[2],
                        screenSizeWidth: screenSize.width * 0.40,
                        screenSizeHeight: screenSize.height * 0.30,
                        angle: 0,
                        margin: const EdgeInsets.only(left: 0),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20), 
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          shape: const ContinuousRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Set Up',
                          style: TextStyle(color: Colors.greenAccent),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade900, 
                        shape: const ContinuousRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Find More to Download',
                        style: TextStyle(color:titleColor), 
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
