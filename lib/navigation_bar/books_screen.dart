import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingappv1/classes/search_field.dart';
import 'package:readingappv1/empty_widget.dart';
import 'package:readingappv1/navigation_bar/book_item.dart';
import 'package:readingappv1/service/api_helper.dart';

import '../service/method.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  final int _page = 0;
  late PageController bookPageController;
  RxList<dynamic> books = RxList([]);
  RxBool isLoading = true.obs;

  Future<void> getBooksList() async {
    dynamic body = {
      // 'search': 'string',
      'pagination': {
        'current': 1,
        'pageSize': 100,
      },
      'contentType': 'All',
    };

    var (isSuccess, response) = await ApiHelper.instance.sendHttpRequest(
      urlPath: '/api/content/list/paginated',
      method: Method.post,
      body: body,
    );
    isLoading.value = false;

    if (isSuccess) {
      books.value = response['data'];
    }
  }

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
              style: TextStyle(
                  fontFamily: 'InterTight',
                  fontWeight: FontWeight.w400,
                  fontSize: 26,
                  color: Colors.black),
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
                        fontFamily: 'InterTight',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Container(
                        height: 35,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(2))),
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
                        height: 35,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(2))),
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
                        height: 35,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(2))),
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
                if (isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                return books.isEmpty
                    ? const EmptyWidget()
                    : SizedBox(
                        height: 600,
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
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
