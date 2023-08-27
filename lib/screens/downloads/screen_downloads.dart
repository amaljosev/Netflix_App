import 'package:flutter/material.dart';
import 'package:netflix/screens/downloads/widgets/appbar_downloads.dart';
import 'package:netflix/screens/downloads/widgets/body_downloads.dart';

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppbarDownloads(title: 'Downloads'),
      ),
      body: BodyDownloads(), 
    );
  }
}
