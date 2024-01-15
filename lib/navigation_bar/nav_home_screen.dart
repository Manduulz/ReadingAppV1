import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';

class navHomeScreen extends StatefulWidget {
  const navHomeScreen({super.key});

  @override
  State<navHomeScreen> createState() => _navHomeScreenState();
}

class _navHomeScreenState extends State<navHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Color(0xffE8EFF5),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xff007CD6), Color(0xff272E6A)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: SizedBox(
                    width: 350,
                    height: 184,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          textDirection: TextDirection.rtl,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'Lorem',
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'InterTight',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'ipsum dolor',
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'InterTight',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                'sit amet amet.',
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'InterTight',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Lorem ipsum',
                                      style: TextStyle(
                                          fontFamily: 'InterTight',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Colors.white),
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      PhosphorIcons.arrow_right,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Image(
                            image: AssetImage('assets/images/book.png'),
                            width: 150,
                            height: 150,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 38)),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed('/books');
                  },
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
                      width: 350,
                      height: 80,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(0, 124, 214, 0.2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: SizedBox(
                                width: 60,
                                height: 60,
                                child: Icon(
                                  PhosphorIcons.book_open,
                                  color: Color(0xff007CD6),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Номнууд',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'InterTight',
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff272E6A),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: Icon(
                                  PhosphorIcons.arrow_right,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 16)),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed('/idiom');
                  },
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
                      width: 350,
                      height: 80,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(0, 124, 214, 0.2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: SizedBox(
                                width: 60,
                                height: 60,
                                child: Icon(
                                  PhosphorIcons.film_script,
                                  color: Color(0xff007CD6),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Хэлц үг, Зүйр үг',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'InterTight',
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff272E6A),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: SizedBox(
                                width: 24,
                                height: 24,
                                child: Icon(
                                  PhosphorIcons.arrow_right,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 390,
                  height: 62,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Таны унших явц',
                          style: TextStyle(
                              fontFamily: 'InterTight',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Засварлах',
                              style: TextStyle(
                                  fontFamily: 'InterTight',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  // color: Color(0xff007CD680)
                                  color: Color.fromRGBO(0, 124, 214, 0.50)),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed('/readinghome');
                  },
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
                      width: 350,
                      height: 127,
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 20)),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color(0xffE8EFF5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(32, 0, 0, 0)),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            textDirection: TextDirection.rtl,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Text(
                                'Өнхрүүш',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'InterTight',
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.black),
                              ),
                              Text(
                                'Үлгэрийн ном',
                                style: TextStyle(
                                    fontFamily: 'InterTight',
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(0, 0, 0, 0.50)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Text(
                                  '0%',
                                  style: TextStyle(
                                    fontFamily: 'InterTight',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Color(0xff007CD6),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
