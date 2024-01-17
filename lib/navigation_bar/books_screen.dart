import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingappv1/classes/search_field.dart';
import 'package:readingappv1/navigation_bar/book_item.dart';
import 'package:readingappv1/service/api_helper.dart';

import '../service/method.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  int _page = 0;
  late PageController bookPageController;
  RxList<dynamic> books = RxList([]);
  RxBool isLoading = true.obs;

  @override
  void initState() {
    super.initState();
    bookPageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    bookPageController.dispose();
  }

  Future<void> getBooksList() async {
    dynamic response = await ApiHelper.instance.sendHttpRequest(
      urlPath: '/api/content/active',
      method: Method.get,
      headers: {'Authorization': 'Bearer B2ZOstS_47qjvE6LD4zHFRF1cnkbK4nILpttt9f-HJY'},
    );

    books.value = response;

    log('setgel : $response');
  }

  @override
  Widget build(BuildContext context) {
    getBooksList();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,

        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(kToolbarHeight),
        //   child: Padding(padding: const EdgeInsets.all(20.0)),
        // ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 32,
          ),
        ),
        title: const Column(
          children: [
            Text(
              'Хайлт',
              style: TextStyle(fontFamily: 'InterTight', fontWeight: FontWeight.w400, fontSize: 26, color: Colors.black),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SearchField(),
              const Padding(
                padding: EdgeInsets.only(left: 30.0, top: 24),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Ангилал',
                    style: TextStyle(
                        fontFamily: 'InterTight', fontStyle: FontStyle.normal, fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Container(
                        width: 39,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(2))),
                        child: Text(
                          'Бүгд',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'InterTight',
                              color: _page == 0 ? Colors.blue : Colors.grey),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Container(
                        width: 99,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(2))),
                        child: Text(
                          'Хадгалсан ном',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'InterTight',
                              color: _page == 1 ? Colors.blue : Colors.grey),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Container(
                        width: 39,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(2))),
                        child: Text(
                          'Архив',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'InterTight',
                              color: _page == 2 ? Colors.blue : Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Obx(() {
                return SizedBox(
                  height: 400,
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemCount: books.length,
                      itemBuilder: (BuildContext context, int index) {
                        return BookItem(detail: books[index]);
                      }),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
