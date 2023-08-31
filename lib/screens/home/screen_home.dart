import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/api/api.dart';
import 'package:netflix/models/tv.dart';
import 'package:netflix/screens/home/widgets/appbar/sub_appbar_widget.dart';
import 'package:netflix/screens/home/widgets/categories/movie/main_card_widget.dart';
import 'package:netflix/screens/home/widgets/categories/movie/maintile_widget.dart';
import 'package:netflix/screens/home/widgets/categories/number/numbertitlecard.dart';
import 'package:netflix/screens/home/widgets/categories/series/maintile_series.dart';
import '../../core/colors/common_colors.dart';
import '../../models/movie.dart';
import 'widgets/appbar/appbar_actions.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upComingMovies;
  late Future<List<TvSeries>> topRatedSeries;

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    upComingMovies = Api().getUpcomingMovies();
    topRatedSeries = Api().getTopRatedSeries();
  }

  static const logo =
      "https://i.insider.com/576837b852bcd01a008ca3bf?width=750&format=jpeg&auto=webp";
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
                  ListView(
                    padding: const EdgeInsets.all(20),
                    children: [
                      SizedBox(
                        child: FutureBuilder(
                          future: trendingMovies,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(snapshot.error.toString()),
                              );
                            } else if (snapshot.hasData) {
                              return MainCardWidget(
                                snapshot: snapshot,
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        child: FutureBuilder(
                          future: trendingMovies,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(snapshot.error.toString()),
                              );
                            } else if (snapshot.hasData) {
                              return MainTileCard(
                                title: "Trending Now",
                                snapshot: snapshot,
                              );
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        child: FutureBuilder(
                          future: topRatedMovies,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(snapshot.error.toString()),
                              );
                            } else if (snapshot.hasData) {
                              return NumberTitileCard(
                                text: 'Top Rated Movies',
                                snapshot: snapshot,
                              );
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        child: FutureBuilder(
                          future: upComingMovies,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(snapshot.error.toString()),
                              );
                            } else if (snapshot.hasData) {
                              return MainTileCard(
                                title: "Upcoming Movies",
                                snapshot: snapshot,
                              );
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        child: FutureBuilder(
                          future: topRatedSeries,
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(snapshot.error.toString()),
                              );
                            } else if (snapshot.hasData) {
                              return MainTileCardSeries(
                                title: "Top Rated TV Series",
                                snapshot: snapshot,
                              );
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                   // ignore: prefer_const_constructors
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
