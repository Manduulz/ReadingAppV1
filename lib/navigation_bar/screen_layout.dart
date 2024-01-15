import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:readingappv1/navigation_bar/nav_home_screen.dart';
import 'package:readingappv1/navigation_bar/profile_screen.dart';
import 'package:readingappv1/navigation_bar/statistic_screen.dart';

class ScreenLayout extends StatefulWidget {
  const ScreenLayout({super.key});

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  // void showAlertDialog(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //             insetPadding: EdgeInsets.all(15),
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.all(Radius.circular(15)),
  //             ),
  //             content: SizedBox(
  //                 width: 225,
  //                 height: 132,
  //                 child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.start,
  //                     children: [
  //                       Row(children: [
  //                         TextButton(
  //                             onPressed: () {},
  //                             child: Text(
  //                               'Текст оруулах',
  //                               style: TextStyle(
  //                                   fontFamily: 'InterTight',
  //                                   fontStyle: FontStyle.normal,
  //                                   fontWeight: FontWeight.w500,
  //                                   fontSize: 16,
  //                                   color: Colors.black),
  //                             )),
  //                         IconButton(
  //                             onPressed: () {}, icon: Icon(Icons.short_text)),
  //                         Row(
  //                           children: [
  //                             TextButton(
  //                                 onPressed: () {},
  //                                 child: Text(
  //                                   'Файл нэмэх',
  //                                   style: TextStyle(
  //                                       fontFamily: 'InterTight',
  //                                       fontStyle: FontStyle.normal,
  //                                       fontWeight: FontWeight.w500,
  //                                       fontSize: 16,
  //                                       color: Colors.black),
  //                                 )),
  //                             IconButton(
  //                                 onPressed: () {},
  //                                 icon: Icon(Icons.arrow_circle_up_sharp)),
  //                             Row(
  //                               children: [
  //                                 TextButton(
  //                                     onPressed: () {},
  //                                     child: Text(
  //                                       'Текст сканнердах',
  //                                       style: TextStyle(
  //                                           fontFamily: 'InterTight',
  //                                           fontStyle: FontStyle.normal,
  //                                           fontWeight: FontWeight.w500,
  //                                           fontSize: 16,
  //                                           color: Colors.black),
  //                                     )),
  //                                 IconButton(
  //                                     onPressed: () {},
  //                                     icon: Icon(Icons.select_all))
  //                               ],
  //                             )
  //                           ],
  //                         ),
  //                       ]),
  //                     ])));
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: onPageChanged,
          children: [
            navHomeScreen(),
            StatisticScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 65,
        child: CupertinoTabBar(
          backgroundColor: Color(0xffE8EFF5),
          onTap: navigationTapped,
          items: [
            BottomNavigationBarItem(
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      PhosphorIcons.house,
                      color: _page == 0 ? Color(0xff007CD6) : Colors.white,
                      size: 32,
                    ),
                    Text(
                      'Нүүр',
                      style: TextStyle(
                        fontFamily: 'InterTight',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                        color: _page == 0 ? Color(0xff007CD6) : Colors.white,
                      ),
                    )
                  ],
                ),
                backgroundColor: Colors.white,
                label: ''),
            BottomNavigationBarItem(
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      PhosphorIcons.chart_bar,
                      color: _page == 1 ? Color(0xff007CD6) : Colors.white,
                      size: 32,
                    ),
                    Text(
                      'Статистик',
                      style: TextStyle(
                        fontFamily: 'InterTight',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                        color: _page == 1 ? Color(0xff007CD6) : Colors.white,
                      ),
                    )
                  ],
                ),
                backgroundColor: Colors.white,
                label: ''),
            BottomNavigationBarItem(
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      PhosphorIcons.user_circle,
                      color: _page == 2 ? Color(0xff007CD6) : Colors.white,
                      size: 32,
                    ),
                    Text(
                      'Хэрэглэгч',
                      style: TextStyle(
                        fontFamily: 'InterTight',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        fontSize: 10,
                        color: _page == 2 ? Color(0xff007CD6) : Colors.white,
                      ),
                    )
                  ],
                ),
                backgroundColor: Colors.white,
                label: ''),
          ],
        ),
      ),
    );
  }
}
