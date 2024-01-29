import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:readingappv1/bar_graph/bar_graph.dart';

class StatisticScreen extends StatefulWidget {
  const StatisticScreen({
    super.key,
  });

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  List<double> weeklySummary = [
    123,
    70,
    142,
    36,
    11,
    97,
    80,
  ];
  List<double> daySummary = [
    75,
    0,
    0,
    0,
    88,
    0,
    100,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: const Color(0xffE8EFF5),
        centerTitle: true,

        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(kToolbarHeight),
        //   child: Padding(padding: const EdgeInsets.all(20.0)),
        // ),

        title: const Text(
          'Статистик',
          style: TextStyle(
              fontFamily: 'InterTight',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: Color.fromRGBO(0, 0, 0, 0.50)),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Өнөөдөр',
                  style: TextStyle(
                      fontFamily: 'InterTight',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.black),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      color: const Color(0xffE8EFF5),
                      child: const Row(
                        children: [
                          Icon(
                            PhosphorIcons.caret_circle_up,
                            color: Colors.grey,
                            size: 35,
                          ),
                          Column(
                            children: [
                              Text(
                                'Уншсан',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontFamily: 'InterTight',
                                    color: Color.fromRGBO(0, 0, 0, 0.50)),
                              ),
                              Text(
                                '0 үг',
                                style: TextStyle(
                                    fontFamily: 'InterTight',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Color(0xff007CD6)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: const Color(0xffE8EFF5),
                      child: const Row(
                        children: [
                          Icon(
                            PhosphorIcons.caret_circle_up,
                            color: Colors.grey,
                            size: 35,
                          ),
                          Column(
                            children: [
                              Text(
                                'Хурд',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontFamily: 'InterTight',
                                    color: Color.fromRGBO(0, 0, 0, 0.50)),
                              ),
                              Text(
                                '0 үг/мин',
                                style: TextStyle(
                                    fontFamily: 'InterTight',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Color(0xffFF9501)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Сүүлийн 7 хоног',
                  style: TextStyle(
                      fontFamily: 'InterTight',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.black),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      color: const Color(0xffE8EFF5),
                      child: const Row(
                        children: [
                          Icon(
                            PhosphorIcons.caret_circle_up,
                            color: Colors.grey,
                            size: 35,
                          ),
                          Column(
                            children: [
                              Text(
                                'Уншсан',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontFamily: 'InterTight',
                                    color: Color.fromRGBO(0, 0, 0, 0.50)),
                              ),
                              Text(
                                '0 үг',
                                style: TextStyle(
                                    fontFamily: 'InterTight',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Color(0xff007CD6)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: const Color(0xffE8EFF5),
                      child: const Row(
                        children: [
                          Icon(
                            PhosphorIcons.caret_circle_up,
                            color: Colors.grey,
                            size: 35,
                          ),
                          Column(
                            children: [
                              Text(
                                'Хурд',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontFamily: 'InterTight',
                                    color: Color.fromRGBO(0, 0, 0, 0.50)),
                              ),
                              Text(
                                '0 үг/мин',
                                style: TextStyle(
                                    fontFamily: 'InterTight',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Color(0xffFF9501)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 200,
                    width: 350,
                    child: Container(
                        color: const Color(0xffE8EFF5),
                        child: MyBarGraph(
                          weeklySummary: weeklySummary,
                          daySummary: daySummary,
                        )),
                  ),
                ),
                const Text(
                  'Сүүлийн 4 долоо хоног',
                  style: TextStyle(
                      fontFamily: 'InterTight',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.black),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      color: const Color(0xffE8EFF5),
                      child: const Row(
                        children: [
                          Icon(
                            PhosphorIcons.caret_circle_up,
                            color: Colors.grey,
                            size: 35,
                          ),
                          Column(
                            children: [
                              Text(
                                'Уншсан',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontFamily: 'InterTight',
                                    color: Color.fromRGBO(0, 0, 0, 0.50)),
                              ),
                              Text(
                                '0 үг',
                                style: TextStyle(
                                    fontFamily: 'InterTight',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Color(0xff007CD6)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: const Color(0xffE8EFF5),
                      child: const Row(
                        children: [
                          Icon(
                            PhosphorIcons.caret_circle_up,
                            color: Colors.grey,
                            size: 35,
                          ),
                          Column(
                            children: [
                              Text(
                                'Хурд',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontFamily: 'InterTight',
                                    color: Color.fromRGBO(0, 0, 0, 0.50)),
                              ),
                              Text(
                                '0 үг/мин',
                                style: TextStyle(
                                    fontFamily: 'InterTight',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Color(0xffFF9501)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 200,
                    width: 350,
                    child: Container(
                        color: const Color(0xffE8EFF5),
                        child: MyBarGraph(
                          weeklySummary: weeklySummary,
                          daySummary: daySummary,
                        )),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Статистик Шинэчлэх',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'InterTight',
                        color: Colors.red,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
