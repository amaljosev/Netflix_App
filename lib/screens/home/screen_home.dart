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
  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];

  static const String apiKey = 'e6227c69efda2538922e54d7b2abadcf';
  static const readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNjIyN2M2OWVmZGEyNTM4OTIyZTU0ZDdiMmFiYWRjZiIsInN1YiI6IjY0ZWNhMWE3ZTg5NGE2MDBlNGU3YzU0NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ESjN0I4CS8rXzgIPLUcVc7np9shcUHxu392Gnf4bMes';

  static const mainImage =
      "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/hUJ0UvQ5tgE2Z9WpfuduVSdiCiU.jpg";
  static const logo =
      "https://i.insider.com/576837b852bcd01a008ca3bf?width=750&format=jpeg&auto=webp";

  loadMovies() async {
    TMDB tmdbWithCoustomLogs = TMDB(
      ApiKeys(apiKey, readAccessToken),
      logConfig: const ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );

    Map trendingResult = await tmdbWithCoustomLogs.v3.trending.getTrending();
    Map topRatedResults = await tmdbWithCoustomLogs.v3.movies.getTopRated(); 
    Map tvResults = await tmdbWithCoustomLogs.v3.tv.getPopular();

    setState(() {
      trendingMovies = trendingResult['results'];  

      topRatedMovies = topRatedResults['results'];

      tv = tvResults['results'];
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldColor,
        appBar: appBar(logo,context),
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
                        MainCardWidget(mainImage: mainImage),
                        MainTileCard(
                          title: "Released in the Past Year",
                          movieList: trendingMovies, 
                          getPosterPath:  (movie) => movie['poster_path'] ?? '',   
                        ),
                        MainTileCard(
                          title: "Trending Now",
                          movieList: trendingMovies, 
                          getPosterPath:  (movie) => movie['poster_path'] ?? '', 
                        ),
                         NumberTitileCard(movieList:topRatedMovies,getPosterPath:(movie) => movie['poster_path'] ?? '',   ),
                        MainTileCard(
                          title: "Watch for a while",
                          movieList: trendingMovies, 
                          getPosterPath:  (movie) => movie['poster_path'] ?? '', 
                        ),
                        MainTileCard(
                          title: "Only on Netflix",
                          movieList: trendingMovies, 
                          getPosterPath:  (movie) => movie['poster_path'] ?? '', 
                        ),
                        MainTileCard(
                          title: "Recently Released",
                          movieList: trendingMovies, 
                          getPosterPath:  (movie) => movie['poster_path'] ?? '',  
                        ),
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
