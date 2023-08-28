import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/screens/home/widgets/appbar/sub_appbar_widget.dart';
import 'package:netflix/screens/home/widgets/main_card_widget.dart';
import 'package:netflix/screens/home/widgets/maintile_widget.dart';
import 'package:netflix/screens/home/widgets/numbertitlecard.dart';
import 'package:tmdb_api/tmdb_api.dart';
import '../../core/colors/common_colors.dart';
import 'widgets/appbar/appbar_actions.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {


List trendingMovies = [];
    static const String apiKey = 'e6227c69efda2538922e54d7b2abadcf';
    static const readAccessToken =
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNjIyN2M2OWVmZGEyNTM4OTIyZTU0ZDdiMmFiYWRjZiIsInN1YiI6IjY0ZWNhMWE3ZTg5NGE2MDBlNGU3YzU0NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ESjN0I4CS8rXzgIPLUcVc7np9shcUHxu392Gnf4bMes';
    final imageList = [
      "https://www.themoviedb.org/t/p/w220_and_h330_face/8Gxv8gSFCU0XGDykEGv7zR1n2ua.jpg",
      "https://www.themoviedb.org/t/p/w220_and_h330_face/iuFNMS8U5cb6xfzi51Dbkovj7vM.jpg",
      "https://www.themoviedb.org/t/p/w220_and_h330_face/37p95Lpe7mfVX86ZcVr7TisAHPn.jpg",
      "https://www.themoviedb.org/t/p/w220_and_h330_face/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg",
      "https://www.themoviedb.org/t/p/w220_and_h330_face/8riWcADI1ekEiBguVB9vkilhiQm.jpg",
    ];
    static const mainImage = 
        "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/hUJ0UvQ5tgE2Z9WpfuduVSdiCiU.jpg";
    static const logo =
        "https://i.insider.com/576837b852bcd01a008ca3bf?width=750&format=jpeg&auto=webp";

    loadMovies() async {
      TMDB tmdbWithCoustomLogs = TMDB(
        ApiKeys(apiKey, readAccessToken),
        logConfig: ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ),
      );
      Map trendingResult=await tmdbWithCoustomLogs.v3.trending.getTrending(); 
    }

  @override
  Widget build(BuildContext context) {
    
    

    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldColor,
        appBar: newMethod(logo),
        extendBodyBehindAppBar: true,
        body: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (context, index, _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                if (direction == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }

                return true;
              },
              child: Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 30),
                    child: ListView(
                      children: [
                        const MainCardWidget(mainImage: mainImage),
                        MainTileCard(
                            title: "Released in the Past Year",
                            image: imageList[0]),
                        MainTileCard(
                            title: "Trending Now", image: imageList[1]),
                        const NumberTitileCard(),
                        MainTileCard(
                            title: "Watch for a while", image: imageList[2]),
                        MainTileCard(
                            title: "Only on Netflix", image: imageList[3]),
                        MainTileCard(
                            title: "Recently Released", image: imageList[4]),
                      ],
                    ),
                  ),
                  SubAppbarWidget(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
