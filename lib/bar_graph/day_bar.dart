import 'package:readingappv1/bar_graph/invidual_bar.dart';

class DayBarData {
  final double moAmount;
  final double tuAmount;
  final double weAmount;
  final double thAmount;
  final double frAmount;
  final double saAmount;
  final double suAmount;
  DayBarData({
    required this.moAmount,
    required this.tuAmount,
    required this.weAmount,
    required this.thAmount,
    required this.frAmount,
    required this.saAmount,
    required this.suAmount,
  });
  List<InvidualBar> dayBarData = [];

  void initializeDayBarData() {
    dayBarData = [
      InvidualBar(x: 1, y: moAmount),
      InvidualBar(x: 2, y: tuAmount),
      InvidualBar(x: 3, y: weAmount),
      InvidualBar(x: 4, y: thAmount),
      InvidualBar(x: 5, y: frAmount),
      InvidualBar(x: 6, y: saAmount),
      InvidualBar(x: 7, y: suAmount),
    ];
  }
}
