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
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Color(0xffE8EFF5),
        centerTitle: true,

        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(kToolbarHeight),
        //   child: Padding(padding: const EdgeInsets.all(20.0)),
        // ),

        title: Text(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 15, 0, 0),
                child: Text(
                  'Өнөөдөр',
                  style: TextStyle(
                      fontFamily: 'InterTight',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.black),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 0, 0),
                    child: Container(
                      width: 167,
                      height: 54,
                      color: Color(0xffE8EFF5),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 18, top: 0, right: 0, bottom: 0),
                            child: Icon(
                              PhosphorIcons.caret_circle_up,
                              color: Colors.grey,
                              size: 35,
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(12, 8, 0, 0),
                                child: Text(
                                  'Уншсан',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'InterTight',
                                      color: Color.fromRGBO(0, 0, 0, 0.50)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, top: 0, right: 10, bottom: 0),
                                child: Text(
                                  '0 үг',
                                  style: TextStyle(
                                      fontFamily: 'InterTight',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Color(0xff007CD6)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                    child: Container(
                      width: 167,
                      height: 54,
                      color: Color(0xffE8EFF5),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 18, top: 0, right: 0, bottom: 0),
                            child: Icon(
                              PhosphorIcons.caret_circle_up,
                              color: Colors.grey,
                              size: 35,
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(4, 8, 13, 0),
                                child: Text(
                                  'Хурд',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'InterTight',
                                      color: Color.fromRGBO(0, 0, 0, 0.50)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, top: 0, right: 0, bottom: 0),
                                child: Text(
                                  '0 үг/мин',
                                  style: TextStyle(
                                      fontFamily: 'InterTight',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Color(0xffFF9501)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 25, 0, 0),
                child: Text(
                  'Сүүлийн 7 хоног',
                  style: TextStyle(
                      fontFamily: 'InterTight',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.black),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 0, 0),
                    child: Container(
                      width: 167,
                      height: 54,
                      color: Color(0xffE8EFF5),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 18, top: 0, right: 0, bottom: 0),
                            child: Icon(
                              PhosphorIcons.caret_circle_up,
                              color: Colors.grey,
                              size: 35,
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(12, 8, 0, 0),
                                child: Text(
                                  'Уншсан',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'InterTight',
                                      color: Color.fromRGBO(0, 0, 0, 0.50)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, top: 0, right: 10, bottom: 0),
                                child: Text(
                                  '0 үг',
                                  style: TextStyle(
                                      fontFamily: 'InterTight',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Color(0xff007CD6)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                    child: Container(
                      width: 167,
                      height: 54,
                      color: Color(0xffE8EFF5),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 18, top: 0, right: 0, bottom: 0),
                            child: Icon(
                              PhosphorIcons.caret_circle_up,
                              color: Colors.grey,
                              size: 35,
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(4, 8, 13, 0),
                                child: Text(
                                  'Хурд',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'InterTight',
                                      color: Color.fromRGBO(0, 0, 0, 0.50)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, top: 0, right: 0, bottom: 0),
                                child: Text(
                                  '0 үг/мин',
                                  style: TextStyle(
                                      fontFamily: 'InterTight',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Color(0xffFF9501)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  height: 200,
                  width: 350,
                  child: Container(
                      color: Color(0xffE8EFF5),
                      child: MyBarGraph(weeklySummary: weeklySummary)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(22, 25, 0, 0),
                child: Text(
                  'Сүүлийн 4 долоо хоног',
                  style: TextStyle(
                      fontFamily: 'InterTight',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.black),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 0, 0),
                    child: Container(
                      width: 167,
                      height: 54,
                      color: Color(0xffE8EFF5),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 18, top: 0, right: 0, bottom: 0),
                            child: Icon(
                              PhosphorIcons.caret_circle_up,
                              color: Colors.grey,
                              size: 35,
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(12, 8, 0, 0),
                                child: Text(
                                  'Уншсан',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'InterTight',
                                      color: Color.fromRGBO(0, 0, 0, 0.50)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, top: 0, right: 10, bottom: 0),
                                child: Text(
                                  '0 үг',
                                  style: TextStyle(
                                      fontFamily: 'InterTight',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Color(0xff007CD6)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
                    child: Container(
                      width: 167,
                      height: 54,
                      color: Color(0xffE8EFF5),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 18, top: 0, right: 0, bottom: 0),
                            child: Icon(
                              PhosphorIcons.caret_circle_up,
                              color: Colors.grey,
                              size: 35,
                            ),
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(4, 8, 13, 0),
                                child: Text(
                                  'Хурд',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'InterTight',
                                      color: Color.fromRGBO(0, 0, 0, 0.50)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, top: 0, right: 0, bottom: 0),
                                child: Text(
                                  '0 үг/мин',
                                  style: TextStyle(
                                      fontFamily: 'InterTight',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Color(0xffFF9501)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  height: 200,
                  width: 350,
                  child: Container(
                      color: Color(0xffE8EFF5),
                      child: MyBarGraph(weeklySummary: weeklySummary)),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
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
    );
  }
}
