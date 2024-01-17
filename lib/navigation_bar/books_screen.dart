import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingappv1/classes/search_field.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  int _page = 0;
  late PageController bookPageController;

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
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 32,
          ),
        ),
        title: Column(
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
              SearchField(),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 24),
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
                        decoration: BoxDecoration(
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
                        width: 99,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
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
                        width: 39,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
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
              Padding(padding: EdgeInsets.only(top: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Get.toNamed('/bookdetail');
                    },
                    child: Container(
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
                      child: SizedBox(
                        width: 155,
                        height: 201,
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Container(
                              width: 135,
                              height: 116,
                              decoration: BoxDecoration(
                                color: Color(0xffE8EFF5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0, left: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Өнхрүүш',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'InterTight',
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4.0, left: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Үлгэрийн ном',
                                      style: TextStyle(
                                          fontFamily: 'InterTight',
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(0, 0, 0, 0.50)),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 15,
                                offset: Offset(2, 4))
                          ]),
                      child: SizedBox(
                        width: 155,
                        height: 201,
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Container(
                              width: 135,
                              height: 116,
                              decoration: BoxDecoration(
                                color: Color(0xffE8EFF5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0, left: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Өнхрүүш',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'InterTight',
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4.0, left: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Үлгэрийн ном',
                                      style: TextStyle(
                                          fontFamily: 'InterTight',
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(0, 0, 0, 0.50)),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MaterialButton(
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 15,
                                offset: Offset(2, 4))
                          ]),
                      child: SizedBox(
                        width: 155,
                        height: 201,
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Container(
                              width: 135,
                              height: 116,
                              decoration: BoxDecoration(
                                color: Color(0xffE8EFF5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0, left: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Өнхрүүш',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'InterTight',
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4.0, left: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Үлгэрийн ном',
                                      style: TextStyle(
                                          fontFamily: 'InterTight',
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(0, 0, 0, 0.50)),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 15,
                                offset: Offset(2, 4))
                          ]),
                      child: SizedBox(
                        width: 155,
                        height: 201,
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Container(
                              width: 135,
                              height: 116,
                              decoration: BoxDecoration(
                                color: Color(0xffE8EFF5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0, left: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Өнхрүүш',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'InterTight',
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4.0, left: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Үлгэрийн ном',
                                      style: TextStyle(
                                          fontFamily: 'InterTight',
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(0, 0, 0, 0.50)),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  MaterialButton(
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 15,
                                offset: Offset(2, 4))
                          ]),
                      child: SizedBox(
                        width: 155,
                        height: 201,
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Container(
                              width: 135,
                              height: 116,
                              decoration: BoxDecoration(
                                color: Color(0xffE8EFF5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0, left: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Өнхрүүш',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'InterTight',
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4.0, left: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Үлгэрийн ном',
                                      style: TextStyle(
                                          fontFamily: 'InterTight',
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(0, 0, 0, 0.50)),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 15,
                                offset: Offset(2, 4))
                          ]),
                      child: SizedBox(
                        width: 155,
                        height: 201,
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 10)),
                            Container(
                              width: 135,
                              height: 116,
                              decoration: BoxDecoration(
                                color: Color(0xffE8EFF5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0, left: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Өнхрүүш',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'InterTight',
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 4.0, left: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Үлгэрийн ном',
                                      style: TextStyle(
                                          fontFamily: 'InterTight',
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(0, 0, 0, 0.50)),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
