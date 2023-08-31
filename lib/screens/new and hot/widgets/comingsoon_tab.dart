import 'package:flutter/material.dart';
import '../../../core/colors/common_colors.dart';
import '../../../core/font.dart';
import '../screen_new_and_hot.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });
 
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: 350, 
      child: Row(
        children: [
          const SizedBox(
            width: 60,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'AUG',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(
                    '31',
                    style: TextStyle(
                        color: titleColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: size.width - 80,
            height: 400,
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 150,
                      child: Image.network(
                        newAndHotTempImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      right: 5,
                      top: 115,
                      child: CircleAvatar(
                        maxRadius: 15,
                        backgroundColor: Colors.black87,
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.volume_up_outlined,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 180,
                        height: 60,
                        child: Image.network(
                          logo,
                          fit: BoxFit.cover, 
                        ),
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add_alert_outlined,
                              color: titleColor,
                            ),
                          ),
                          const Text(
                            "Remaind Me",
                            style: TextStyle(color: textColor, fontSize: 10),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.info_outline,
                              color: titleColor,
                            ),
                          ),
                          const Text(
                            'info',
                            style: TextStyle(color: textColor, fontSize: 10),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Coming on Thursday", style: titleTextStyle),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "With his straw hat and regtag crew, young pirateMonkey D. Luffy goes on an epic voyage for tresure in this live-action adaptation of the popular manga",
                        style: contentTextStyle,
                      ),
                    ),
                    Text(
                        "Rousing • Adventure • Visually Striking • Pirates • Manga",
                        style: contentTextStyle),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
