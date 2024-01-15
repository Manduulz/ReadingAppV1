import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingappv1/bar_graph/bar_graph_page.dart';
import 'package:readingappv1/classes/circle_loading.dart';
import 'package:readingappv1/classes/voice_recorder.dart';
import 'package:readingappv1/forgot_password_screen.dart';
import 'package:readingappv1/log_in_screen.dart';
import 'package:readingappv1/navigation_bar/book_detail_screen.dart';
import 'package:readingappv1/navigation_bar/books_screen.dart';
import 'package:readingappv1/navigation_bar/idiom_screen.dart';
import 'package:readingappv1/navigation_bar/nav_home_screen.dart';
import 'package:readingappv1/navigation_bar/profile_screen.dart';
import 'package:readingappv1/navigation_bar/screen_layout.dart';
import 'package:readingappv1/navigation_bar/statistic_screen.dart';
import 'package:readingappv1/profile_settings/change_account_screen.dart';
import 'package:readingappv1/profile_settings/information_screen.dart';
import 'package:readingappv1/profile_settings/privacy_screen.dart';
import 'package:readingappv1/reading_screens/reading_screen.dart';
import 'package:readingappv1/sign_up_screen.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    getPages: [
      GetPage(name: '/login', page: () => LogInScreen()),
      GetPage(name: '/signup', page: () => SignUpScreen()),
      GetPage(name: '/forgotpassword', page: () => ForgotPasswordScreen()),
      GetPage(name: '/screenlayout', page: () => ScreenLayout()),
      GetPage(name: '/navhome', page: () => navHomeScreen()),
      GetPage(name: '/statistic', page: () => StatisticScreen()),
      GetPage(name: '/profile', page: () => ProfileScreen()),
      GetPage(name: '/information', page: () => InformationScreen()),
      GetPage(name: '/privacy', page: () => PrivacyScreen()),
      GetPage(name: '/changeacc', page: () => ChangeAccounts()),
      GetPage(name: '/graph', page: () => BarGraphBox()),
      GetPage(name: '/readinghome', page: () => ReadingScreen()),
      GetPage(name: '/books', page: () => BooksScreen()),
      GetPage(name: '/idiom', page: () => IdiomScreen()),
      GetPage(name: '/bookdetail', page: () => BookDetailScreen()),
      GetPage(name: '/loading', page: () => MyLoadingScreen()),
      GetPage(name: '/voice', page: () => VoiceRecorder()),
    ],
  ));
}
