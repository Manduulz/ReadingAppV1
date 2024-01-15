import 'package:flutter/material.dart';
import 'package:readingappv1/navigation_bar/screen_layout.dart';

class MyLoadingScreen extends StatelessWidget {
  const MyLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF8FAFC),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Color(0xff007CD6),
                  backgroundColor: Colors.blueGrey,
                  value: null,
                  strokeAlign: 15,
                  strokeWidth: 5,
                ),
              )
            : ScreenLayout());
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });
  }
}
