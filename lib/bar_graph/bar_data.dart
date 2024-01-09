import 'package:readingappv1/bar_graph/invidual_bar.dart';

class BarData {
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double friAmount;
  final double satAmount;
  final double sunAmount;

  BarData({
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thuAmount,
    required this.friAmount,
    required this.satAmount,
    required this.sunAmount,
  });
  List<InvidualBar> barData = [];

  void initializeBarData() {
    barData = [
      InvidualBar(x: 1, y: monAmount),
      InvidualBar(x: 2, y: tueAmount),
      InvidualBar(x: 3, y: wedAmount),
      InvidualBar(x: 4, y: thuAmount),
      InvidualBar(x: 5, y: friAmount),
      InvidualBar(x: 6, y: satAmount),
      InvidualBar(x: 7, y: sunAmount),
    ];
  }
}
