import 'package:flutter/material.dart';

import '../../../core/colors/common_colors.dart';
import '../../../core/font.dart';
import '../screen_new_and_hot.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: SizedBox(
        width: double.infinity,
        height: 400,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Image.network(
                    newAndHotTempImage,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    height: 20,
                    width: 60,
                    child: const Center(
                        child: Text('U/A 13+',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
                Positioned(
                  left: 155,
                  top: 75,
                  child: CircleAvatar(
                    maxRadius: 25,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: CircleAvatar(
                        maxRadius: 24,
                        backgroundColor: Colors.black87,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 20,
                          ),
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
                          Icons.share_outlined,
                          color: titleColor,
                        ),
                      ),
                      const Text(
                        "Share",
                        style: TextStyle(color: textColor, fontSize: 10),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            color: titleColor,
                          ),
                        ),
                        const Text(
                          'My List',
                          style: TextStyle(color: textColor, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.play_arrow,
                          color: titleColor,
                        ),
                      ),
                      const Text(
                        'Play ',
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
                Text("Watch the Season Finale now", style: titleTextStyle),
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
      ),
    );
  }
}
