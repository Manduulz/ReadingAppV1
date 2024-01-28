import 'package:get/get.dart';
import 'package:readingappv1/pages/view/reading_screen.dart';

class ReadingPages {
  static final pages = [
    GetPage(
      name: '/reading_screen',
      page: () => const ReadingScreen(),
    ),
  ];
}
