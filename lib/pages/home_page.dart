import 'package:tour/pages/like_page.dart';
import 'package:tour/pages/explore_page.dart';
import 'package:tour/pages/profile_page.dart';
import 'package:tour/pages/category_page.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:tour/utils/Colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = [
    const ExplorePage(),
    const ServicesPage(),
    const CartPage(),
    const ProfilePage()
  ];
  int currentPageIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const Drawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            centerTitle: false,
            leading: IconButton(
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              icon: const Icon(Icons.menu),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello ...",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  "Enjoy your tour",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  onPressed: () {},
                  icon: badges.Badge(
                    badgeContent: const Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    position: badges.BadgePosition.topEnd(top: -15, end: -12),
                    badgeStyle: const badges.BadgeStyle(
                      badgeColor: AppColors.green1,
                    ),
                    child: const Icon(IconlyBroken.notification),
                  ),
                ),
              ),
            ],
          ),
          SliverFillRemaining(
            child: pages[currentPageIndex],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPageIndex,
        onTap: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.home),
            label: "Home",
            activeIcon: Icon(IconlyBold.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.search),
            label: "Explore",
            activeIcon: Icon(IconlyBold.search),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.heart),
            label: "Favorite",
            activeIcon: Icon(IconlyBold.heart),
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.profile),
            label: "Profile",
            activeIcon: Icon(IconlyBold.profile),
          ),
        ],
      ),
    );
  }
}