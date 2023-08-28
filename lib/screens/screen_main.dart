import 'package:flutter/material.dart';
import 'package:netflix/screens/downloads/screen_downloads.dart';
import 'package:netflix/screens/home/screen_home.dart';
import 'package:netflix/screens/new%20and%20hot/screen_new_and_hot.dart';
import 'widgets/bottom_navigation.dart';

class ScreenMain extends StatefulWidget {
  const ScreenMain({super.key});

  @override
  State<ScreenMain> createState() => _ScreenMainState();
}

class _ScreenMainState extends State<ScreenMain> {
  final pages = const [ScreenHome(), ScreenNewAndHot(), ScreenDownloads()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, child) => pages[index],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
