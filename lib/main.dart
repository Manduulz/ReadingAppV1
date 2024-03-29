import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:readingappv1/bar_graph/bar_graph_page.dart';
import 'package:readingappv1/classes/circle_loading.dart';
import 'package:readingappv1/classes/voice_recorder.dart';
import 'package:readingappv1/constants.dart';
import 'package:readingappv1/forgot_password_screen.dart';
import 'package:readingappv1/login_screen.dart';
import 'package:readingappv1/navigation_bar/books_screen.dart';
import 'package:readingappv1/navigation_bar/idiom_screen.dart';
import 'package:readingappv1/navigation_bar/nav_home_screen.dart';
import 'package:readingappv1/navigation_bar/profile_screen.dart';
import 'package:readingappv1/navigation_bar/screen_layout.dart';
import 'package:readingappv1/navigation_bar/statistic_screen.dart';
import 'package:readingappv1/pages/speaking_screen/view/speaking_screen.dart';
import 'package:readingappv1/pages/suite/reading_pages.dart';
import 'package:readingappv1/profile_settings/change_account_screen.dart';
import 'package:readingappv1/profile_settings/privacy_screen.dart';
import 'package:readingappv1/service/api_helper.dart';
import 'package:readingappv1/service/my_storage.dart';
import 'package:readingappv1/sign_up_screen.dart';
import 'package:readingappv1/voice/select.dart';
import 'package:readingappv1/voice/speak.dart';

import 'profile_settings/information_screen.dart';

void main() {
  ApiHelper.instance.init(baseUrl: Constants.baseUrl);
  MyStorage.instance.init();

  runApp(
    GlobalLoaderOverlay(
      useDefaultLoading: false,
      overlayWidgetBuilder: (_) {
        return Container(
          color: Colors.black.withOpacity(0.6),
          child: const Center(
            child: SpinKitFadingCircle(
              color: Colors.lightBlueAccent,
              size: 50.0,
            ),
          ),
        );
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        getPages: [
          GetPage(name: '/login', page: () => const LoginScreen()),
          GetPage(name: '/signup', page: () => const SignUpScreen()),
          GetPage(
              name: '/forgotpassword',
              page: () => const ForgotPasswordScreen()),
          GetPage(name: '/screenlayout', page: () => const ScreenLayout()),
          GetPage(name: '/navhome', page: () => const NavHomeScreen()),
          GetPage(name: '/statistic', page: () => const StatisticScreen()),
          GetPage(name: '/profile', page: () => const ProfileScreen()),
          GetPage(
              name: '/information',
              page: () => const InformationScreen(data: {})),
          GetPage(name: '/privacy', page: () => const PrivacyScreen()),
          GetPage(name: '/changeacc', page: () => const ChangeAccounts()),
          GetPage(name: '/graph', page: () => const BarGraphBox()),
          // GetPage(name: '/readinghome', page: () => const ReadingScreen()),
          GetPage(name: '/books', page: () => const BooksScreen()),
          GetPage(name: '/idiom', page: () => const IdiomScreen()),
          // GetPage(name: '/bookdetail', page: () => BookDetailScreen()),
          GetPage(name: '/loading', page: () => const MyLoadingScreen()),
          GetPage(name: '/voice', page: () => const VoiceRecorder()),
          GetPage(name: '/voice/record', page: () => const SpeakScreen()),
          GetPage(
              name: '/voice/select',
              page: () => const SelectVoiceActionScreen()),
          GetPage(name: '/speaking', page: () => const SpeakingScreen()),

          ...ReadingPages.pages,
        ],
      ),
    ),
  );
}
