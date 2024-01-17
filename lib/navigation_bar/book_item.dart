import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingappv1/navigation_bar/book_detail_screen.dart';

class BookItem extends StatelessWidget {
  final dynamic detail;
  const BookItem({required this.detail, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => BookDetailScreen(bookId: detail['id'].toString()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15)),
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 15, offset: Offset(2, 4))]),
        child: Column(
          children: [
            /// TODO : CachedNetworkImage
            Container(
              color: Colors.amber,
              height: 100,
              width: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  detail['name'],
                  style: const TextStyle(
                      fontSize: 16, fontFamily: 'InterTight', fontWeight: FontWeight.w600, fontStyle: FontStyle.normal, color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  detail['contentType'],
                  style: const TextStyle(
                    fontFamily: 'InterTight',
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(0, 0, 0, 0.50),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
