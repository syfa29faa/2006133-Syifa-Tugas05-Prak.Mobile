import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tugas05/configs/app_routes.dart';
import 'package:tugas05/models/user.dart';

import 'home_screen_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.user,
  });
  final User user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late Size size;

  tapBottomItem(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: HeaderWidget(
                user: widget.user,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: SearchFieldWidget(),
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: SectionTitle(
                    label: "Hotest News",
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: InkWell(
                    onTap: () {
                      GoRouter.of(context).goNamed(
                        AppRoutes.newsDetailHot,
                      );
                    },
                    child: HotestNewsCard(
                      size: size,
                      newsTitle: "Ramadhan sudah tiba",
                      pictureUrl:
                          "data:image/jpeg;base64,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",
                      onTap: () {},
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: SectionTitle(
                    label: "Latest News",
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: LatestNewsIndexCardSection(
                    size: size,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: tapBottomItem,
        items: [
          bottomMenuItem(
            "Home",
            Icons.home_rounded,
          ),
          bottomMenuItem(
            "News",
            Icons.newspaper_rounded,
          ),
          bottomMenuItem(
            "Menu",
            Icons.menu_rounded,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem bottomMenuItem(
    String label,
    IconData iconData,
  ) {
    return BottomNavigationBarItem(
      label: label,
      icon: Icon(
        iconData,
      ),
    );
  }
}
