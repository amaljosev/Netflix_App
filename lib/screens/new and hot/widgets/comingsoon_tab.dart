import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../constants/constants.dart';
import '../../../core/colors/common_colors.dart';
import '../../../core/font.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
    required this.snapshot,
    required this.index,
  });
  final AsyncSnapshot snapshot;
  final int index;
  @override
  Widget build(BuildContext context) {
    String date = '${snapshot.data![index].releaseDate}';
    List<String> dateParts = date.split('-');
    final DateTime dateSplit = DateTime.parse(date);
   final month= DateFormat('MMMM').format(dateSplit);
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                   Text(
                    month,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  Text(
                    dateParts[2].toString(),
                    style: const TextStyle(
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
                        '${Constants.imagePath}${snapshot.data![index].backdropPath}',
                        filterQuality: FilterQuality.high,
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
                        child: Text(
                          '${snapshot.data![index].title}',
                          style: const TextStyle(
                              color: titleColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Coming on Thursday", style: titleTextStyle),
                    Text(
                      '${snapshot.data![index].overview}',
                      style: contentTextStyle,
                    ),
                    const Text(
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
