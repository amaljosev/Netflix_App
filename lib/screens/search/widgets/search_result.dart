import 'package:flutter/cupertino.dart';

import '../../../core/colors/common_colors.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Movies & TV',
            style: TextStyle(
                color: titleColor, fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
            child: GridView.count(
          padding: const EdgeInsets.all(10),
          shrinkWrap: true,
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 1 / 1.4,
          children: List.generate(20, (index) => const MainCard()),
        ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    const newAndHotTempImage =
        "https://www.themoviedb.org/t/p/w220_and_h330_face/eyWICPcxOuTcDDDbTMOZawoOn8d.jpg";
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)), 
          image: DecorationImage(
              image: NetworkImage(newAndHotTempImage), fit: BoxFit.fill)),
    );
  }
}
