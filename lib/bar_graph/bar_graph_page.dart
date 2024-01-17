import 'package:flutter/material.dart';
import 'package:readingappv1/bar_graph/bar_graph.dart';

class BarGraphBox extends StatefulWidget {
  const BarGraphBox({super.key});

  @override
  State<BarGraphBox> createState() => _BarGraphBoxState();
}

class _BarGraphBoxState extends State<BarGraphBox> {
  List<double> weeklySummary = [
    40,
    90,
    98,
    132,
    101,
    46,
    68,
  ];
  List<double> daySummary = [
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
      body: Container(
        color: Color(0xffE8EFF5),
        child: SizedBox(
          width: 350,
          height: 200,
          child: MyBarGraph(
            weeklySummary: weeklySummary,
            daySummary: daySummary,
          ),
        ),
      ),
    );
  }
}
