import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';

/// TODO : Make it statelessWidget
class navHomeScreen extends StatefulWidget {
  const navHomeScreen({super.key});

  @override
  State<navHomeScreen> createState() => _navHomeScreenState();
}

class _navHomeScreenState extends State<navHomeScreen> {
  PageController pageController = PageController();
  int pageNo = 0;
  final int numPages = 5;
  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.85,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void startAutoPageChange() {
    Future.delayed(const Duration(seconds: 2), () {
      if (pageNo < numPages - 1) {
        pageNo++;
      } else {
        pageNo = 0;
      }
      // Animate to the next page
      pageController.animateToPage(
        pageNo,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      // Recursively call the function for automatic page change
      startAutoPageChange();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Banners
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (index) {
                      pageNo = index;
                      setState(() {});
                    },
                    itemBuilder: (_, index) {
                      return AnimatedBuilder(
                        animation: pageController,
                        builder: (ctx, child) {
                          return child!;
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 5, right: 5),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xff007CD6), Color(0xff272E6A)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: SizedBox(
                            height: 180,
                          ),
                        ),
                      );
                    },
                    itemCount: numPages,
                  ),
                ),
                const SizedBox(height: 12),

                /// Dots
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => Container(
                        margin: const EdgeInsets.only(
                            right: 8, left: 8, top: 0, bottom: 0),
                        child: Icon(
                          PhosphorIcons.circle_fill,
                          size: 14,
                          color: pageNo == index
                              ? Colors.indigoAccent
                              : Colors.grey.shade300,
                        ),
                      ),
                    )),
                SizedBox(height: 38),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed('/books');
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 15,
                              offset: Offset(2, 4))
                        ]),
                    child: SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(0, 124, 214, 0.2),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: const SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: Icon(
                                      PhosphorIcons.book_open,
                                      color: Color(0xff007CD6),
                                    ),
                                  ),
                                ),
                              ),
                              const Text(
                                'Номнууд',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'InterTight',
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Color(0xff272E6A),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: const SizedBox(
                                width: 24,
                                height: 24,
                                child: Icon(
                                  PhosphorIcons.arrow_right,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 16)),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed('/idiom');
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 15,
                              offset: Offset(2, 4))
                        ]),
                    child: SizedBox(
                      width: 350,
                      height: 80,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(0, 124, 214, 0.2),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: const SizedBox(
                                    width: 60,
                                    height: 60,
                                    child: Icon(
                                      PhosphorIcons.film_script,
                                      color: Color(0xff007CD6),
                                    ),
                                  ),
                                ),
                              ),
                              const Text(
                                'Хэлц үг, Зүйр үг',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'InterTight',
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Color(0xff272E6A),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: const SizedBox(
                                width: 24,
                                height: 24,
                                child: Icon(
                                  PhosphorIcons.arrow_right,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 62,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Таны унших явц',
                          style: TextStyle(
                              fontFamily: 'InterTight',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Засварлах',
                            style: TextStyle(
                                fontFamily: 'InterTight',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                // color: Color(0xff007CD680)
                                color: Color.fromRGBO(0, 124, 214, 0.50)),
                          ))
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed('/readinghome');
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 15,
                              offset: Offset(2, 4))
                        ]),
                    child: SizedBox(
                      height: 104,
                      child: Row(
                        children: [
                          const Padding(padding: EdgeInsets.only(left: 10)),
                          Container(
                            width: 84,
                            height: 84,
                            decoration: const BoxDecoration(
                              color: Color(0xffE8EFF5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          const Padding(
                              padding: EdgeInsets.fromLTRB(32, 0, 0, 0)),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            textDirection: TextDirection.rtl,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Column(
                                  children: [
                                    Text(
                                      'Өнхрүүш',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'InterTight',
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      'Үлгэрийн ном',
                                      style: TextStyle(
                                          fontFamily: 'InterTight',
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(0, 0, 0, 0.50)),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                  '0%',
                                  style: TextStyle(
                                    fontFamily: 'InterTight',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Color(0xff007CD6),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
