import 'package:flutter/material.dart';
import 'package:netflix/screens/new%20and%20hot/widgets/comingsoon_tab.dart';
import 'package:netflix/screens/new%20and%20hot/widgets/everyones_watching_widget.dart';
import '../../core/colors/common_colors.dart';

const newAndHotTempImage =
    "https://i.ytimg.com/vi/nfe7SHu4kcE/maxresdefault.jpg";
const logo =
    "https://upload.wikimedia.org/wikipedia/en/1/1e/One_Piece_Live_Action_Logo.jpg";

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: AppBar(
                backgroundColor: scaffoldColor,
                title: const Text(
                  'New & Hot',
                  style: TextStyle(color: titleColor),
                ),
                actions: [
                  const Icon(
                    Icons.add_alert_outlined,
                    color: titleColor,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(
                      Icons.search_sharp,
                      color: titleColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: redCard,
                          borderRadius: BorderRadius.all(Radius.circular(2))),
                      width: 22,
                      height: 22,
                    ),
                  ),
                ],
                bottom: const TabBar(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.black,
                    unselectedLabelColor: titleColor,
                    dividerColor: Colors.black,
                    indicatorPadding: EdgeInsets.all(9),
                    indicator: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(60),
                      ),
                    ),
                    tabs: [
                      Tab(
                        text: '🍿 Coming Soon',
                      ),
                      Tab(
                        text: "🔥 Everyone's Watching",
                      ),
                    ]),
              ),
            ),
            body: TabBarView(children: [
              buildTabbarViewOne(),
              buildTabbarViewTwo(context),
            ])),
      ),
    );
  }

  Widget buildTabbarViewOne() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const ComingSoonWidget(),
    );
  }

  Widget buildTabbarViewTwo(context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const EveryonesWatchingWidget(),
    );
  }
}
