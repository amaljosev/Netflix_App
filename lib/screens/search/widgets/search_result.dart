import 'package:flutter/cupertino.dart';
import '../../../constants/constants.dart';


class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        
        Expanded(
          child: GridView.count(
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 1 / 1.4,
            children: List.generate(
              20,
              (index) => MainCard(
                snapshot: snapshot,
                index: index,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key, required this.snapshot, required this.index});
  final AsyncSnapshot snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    if (snapshot.data != null && index >= 0 && index < snapshot.data.length) {
      return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        child: Image.network(
          '${Constants.imagePath}${snapshot.data[index].posterPath}',
          fit: BoxFit.cover,
        ),
      );
    } else {
     
      return const SizedBox();
    }
  }
}

