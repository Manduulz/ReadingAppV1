import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:readingappv1/classes/book_center_right_action.dart';
import 'package:readingappv1/service/api_helper.dart';

import '../service/method.dart';

class BookDetailScreen extends StatelessWidget {
  final String bookId;

  BookDetailScreen({required this.bookId, super.key});

  RxMap<String, dynamic> bookDetail = RxMap({});
  RxBool isLoading = true.obs;

  Future<void> getBookDetail() async {
    isLoading.value = true;

    var (isSuccess, response) = await ApiHelper.instance.sendHttpRequest(
      urlPath: '/api/content/$bookId',
      method: Method.get,
    );
    isLoading.value = false;

    log('book detail response : $response');
    if (isSuccess) {
      bookDetail.value = response;
    }
  }



  @override
  Widget build(BuildContext context) {
    /// TODO : remove it from build
    getBookDetail();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xff343330),
            size: 32,
          ),
        ),
        actions: [const CenterRightActionButton()],
      ),
      body: Obx(() {
        return SafeArea(
          child: isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
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
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 15, offset: Offset(2, 4))],
                          ),
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 200,
                            height: 250,
                            child: Image.asset('assets/images/kidBook.jpeg'),
                          ),
                        ),
                        const SizedBox(height: 28),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            bookDetail['name'] ?? '',
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'InterTight',
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          'progressPCT : ${bookDetail['progressPCT']} , id : ${bookDetail['id']}' ?? '',
                          style: const TextStyle(
                            fontFamily: 'InterTight',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 28),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                const Text(
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
                                      child: const Icon(
                                        PhosphorIcons.star,
                                        size: 18,
                                        color: Color.fromRGBO(0, 0, 0, 0.50),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        PhosphorIcons.star,
                                        size: 18,
                                        color: Color.fromRGBO(0, 0, 0, 0.50),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        PhosphorIcons.star,
                                        size: 18,
                                        color: Color.fromRGBO(0, 0, 0, 0.50),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        PhosphorIcons.star,
                                        size: 18,
                                        color: Color.fromRGBO(0, 0, 0, 0.50),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: const Icon(
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
                                color: const Color.fromRGBO(0, 0, 0, 0.50),
                              ),
                            ),
                            const Column(
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
                        const SizedBox(height: 28),
                        Text('${bookDetail['contentText']}' ?? ''),
                        const SizedBox(height: 10),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromRGBO(0, 124, 214, 0.50),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                            onPressed: () {
                              Get.toNamed('/reading_screen', arguments: bookDetail);
                              // Get.toNamed('/voice');
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 280,
                              height: 50,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
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
        );
      }),
    );
  }
}
