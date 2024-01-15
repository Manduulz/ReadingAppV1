import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:readingappv1/classes/book_center_right_action.dart';
import 'package:readingappv1/classes/tts.dart';

class BookDetailScreen extends StatefulWidget {
  const BookDetailScreen({super.key});

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  final textToSpeech = TextToSpeech();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Color(0xff343330),
            size: 32,
          ),
        ),
        actions: [CenterRightActionButton()],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 250,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 15,
                          offset: Offset(2, 4))
                    ],
                  ),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 200,
                    height: 250,
                  ),
                ),
                SizedBox(height: 28),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Номны нэр',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'InterTight',
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  'Номны төрөл',
                  style: TextStyle(
                    fontFamily: 'InterTight',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Үнэлгээ',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'InterTight',
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                PhosphorIcons.star,
                                size: 18,
                                color: Color.fromRGBO(0, 0, 0, 0.50),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                PhosphorIcons.star,
                                size: 18,
                                color: Color.fromRGBO(0, 0, 0, 0.50),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                PhosphorIcons.star,
                                size: 18,
                                color: Color.fromRGBO(0, 0, 0, 0.50),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                PhosphorIcons.star,
                                size: 18,
                                color: Color.fromRGBO(0, 0, 0, 0.50),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                PhosphorIcons.star,
                                size: 18,
                                color: Color.fromRGBO(0, 0, 0, 0.50),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 15.0,
                        left: 15,
                      ),
                      child: Container(
                        width: 1,
                        height: 30,
                        color: Color.fromRGBO(0, 0, 0, 0.50),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          'Нийт уншигч',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'InterTight',
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '0',
                          style: TextStyle(
                              fontFamily: 'InterTight',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color.fromRGBO(0, 0, 0, 0.50)),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 28),
                Container(
                  child: Text(
                      'Lorem ipsum dolor sit amet consectetur. In sed libero aliquam lectus enim elementum. Dolor a tincidunt arcu arcu vestibulum sed sem sodales. Tempus et libero eu curabitur tincidunt mattis curabitur at. Cras lacus nec ac ornare sed nunc.'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(0, 124, 214, 0.50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: () {
                      Get.toNamed('/readinghome');
                      // Get.toNamed('/voice');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 280,
                      height: 50,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(2)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            PhosphorIcons.play,
                            size: 18,
                            color: Colors.white,
                          ),
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Text(
                            textAlign: TextAlign.center,
                            'Эхлүүлэх',
                            style: TextStyle(
                              fontFamily: 'InterTight',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
