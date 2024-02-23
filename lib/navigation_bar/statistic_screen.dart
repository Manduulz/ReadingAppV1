import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:readingappv1/bar_graph/bar_graph.dart';
import 'package:readingappv1/service/api_helper.dart';
import 'package:readingappv1/service/method.dart';

class StatisticScreen extends StatefulWidget {
  const StatisticScreen({
    super.key,
  });

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getStatistics();
    });
  }

  Future<void> getStatistics() async {
    var (isSuccess, _) = await ApiHelper.instance
        .sendHttpRequest(
      urlPath: '/api/statistic/get',
      queryParameters: {
        "timezoneId": "Pacific Standard Time",
        "startDate": "2024-02-22T17:13:15.273Z"
      },
      method: Method.get,
    )
        .catchError((error) {
      return (false, null);
    }).onError((error, stackTrace) async {
      return (false, null);
    });
  }

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
                StatisticReadContent(
                  statisticClass:
                      StatisticClass(title: 'Өнөөдөр', read: 0, speed: 0),
                ),
                const SizedBox(
                  height: 20,
                ),
                StatisticReadContent(
                  statisticClass: StatisticClass(
                      title: 'Сүүлийн 7 хоног', read: 0, speed: 0),
                ),
                StatisticGraphContent(
                    statisticGraphClass: StatisticGraphClass()),
                StatisticReadContent(
                  statisticClass: StatisticClass(
                      title: 'Сүүлийн 4 долоо хоног', read: 0, speed: 0),
                ),
                StatisticGraphContent(
                    statisticGraphClass: StatisticGraphClass()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StatisticClass {
  final String title;
  final double? read;
  final double? speed;

  StatisticClass(
      {required this.title, required this.read, required this.speed});
}

class StatisticGraphClass {
  final List<double>? weeklySummary;
  final List<double>? daySummary;

  StatisticGraphClass(
      {this.weeklySummary = const [
        0,
        0,
        0,
        0,
        0,
        0,
        0,
      ],
      this.daySummary = const [
        75,
        0,
        0,
        0,
        88,
        0,
        100,
      ]});
}

class StatisticGraphContent extends StatefulWidget {
  const StatisticGraphContent({Key? key, required this.statisticGraphClass})
      : super(key: key);

  final StatisticGraphClass statisticGraphClass;

  @override
  State<StatisticGraphContent> createState() => _StatisticGraphContent();
}

class _StatisticGraphContent extends State<StatisticGraphContent> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          height: constraints.maxWidth / 1.5,
          width: constraints.maxWidth,
          child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xffE8EFF5),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2.5,
                        offset: Offset(2, 2))
                  ]),
              child: MyBarGraph(
                weeklySummary: widget.statisticGraphClass.weeklySummary ?? [],
                daySummary: widget.statisticGraphClass.daySummary ?? [],
              )),
        ),
      );
    });
  }
}

class StatisticReadContent extends StatefulWidget {
  const StatisticReadContent({Key? key, required this.statisticClass})
      : super(key: key);

  final StatisticClass statisticClass;

  @override
  State<StatisticReadContent> createState() => _StatisticReadContentState();
}

class _StatisticReadContentState extends State<StatisticReadContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.statisticClass.title,
          style: const TextStyle(
              fontFamily: 'InterTight',
              fontStyle: FontStyle.normal,
              fontSize: 24,
              color: Colors.black),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffE8EFF5),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2.5,
                            offset: Offset(2, 2))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        PhosphorIcons.caret_circle_up,
                        color: Colors.grey,
                        size: 35,
                      ),
                      Column(
                        children: [
                          const Text(
                            'Уншсан',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontFamily: 'InterTight',
                                color: Color.fromRGBO(0, 0, 0, 0.50)),
                          ),
                          Text(
                            '${widget.statisticClass.read} үг',
                            style: const TextStyle(
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
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffE8EFF5),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2.5,
                            offset: Offset(2, 2))
                      ]),
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        PhosphorIcons.caret_circle_up,
                        color: Colors.grey,
                        size: 35,
                      ),
                      Column(
                        children: [
                          const Text(
                            'Хурд',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                fontFamily: 'InterTight',
                                color: Color.fromRGBO(0, 0, 0, 0.50)),
                          ),
                          Text(
                            '${widget.statisticClass.read} үг/мин',
                            style: const TextStyle(
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
