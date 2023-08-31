import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/screens/home/widgets/appbar/sub_appbar_widget.dart';
import 'package:netflix/screens/home/widgets/main_card_widget.dart';
import 'package:netflix/screens/home/widgets/maintile_widget.dart';
import 'package:netflix/screens/home/widgets/numbertitlecard.dart';
import 'package:tmdb_api/tmdb_api.dart';
import '../../core/api.dart';
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

  List upcomingMovies = [];
  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];
  List popularMovies = [];

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
    Map upcoming = await tmdbWithCoustomLogs.v3.movies.getUpcoming();
    Map popular = await tmdbWithCoustomLogs.v3.movies.getPopular();

    setState(
      () {
        trendingMovies = trendingResult['results'];
        upcomingMovies = upcoming['results'];
        topRatedMovies = topRatedResults['results'];
        tv = tvResults['results'];
        popularMovies = popular['results'];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldColor,
        appBar: appBar(logo, context),
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
                        MainCardWidget(
                          movieList: trendingMovies,
                          getPosterPath: (movie) => movie['poster_path'] ?? '',
                        ),
                        MainTileCard(
                          title: "Trending Now",
                          movieList: trendingMovies,
                          getPosterPath: (movie) => movie['poster_path'] ?? '',
                        ),
                        MainTileCard(
                          title: "Top TV Shows",
                          movieList: tv,
                          getPosterPath: (movie) => movie['poster_path'] ?? '',
                        ),
                        NumberTitileCard(
                          movieList: topRatedMovies,
                          text: 'Top Rated Movies',
                          getPosterPath: (movie) => movie['poster_path'] ?? '',
                        ),
                        MainTileCard(
                          title: "Upcoming Movies",
                          movieList: upcomingMovies,
                          getPosterPath: (movie) => movie['poster_path'] ?? '',
                        ),
                        MainTileCard(
                          title: "Popular Movies",
                          movieList: popularMovies,
                          getPosterPath: (movie) => movie['poster_path'] ?? '',
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
