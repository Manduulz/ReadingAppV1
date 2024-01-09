import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Color(0xffE8EFF5),
        centerTitle: true,

        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(kToolbarHeight),
        //   child: Padding(padding: const EdgeInsets.all(20.0)),
        // ),

        title: Text(
          'Хувийн мэдээлэл',
          style: TextStyle(
              fontFamily: 'InterTight',
              fontWeight: FontWeight.w400,
              fontSize: 24,
              color: Color.fromRGBO(52, 51, 48, 0.50)),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 390,
                height: 180,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset('assets/images/profile.png'),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      'Username',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'InterTight',
                          fontStyle: FontStyle.normal,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    textAlign: TextAlign.start,
                    'Хяналтын самбар',
                    style: TextStyle(
                        fontFamily: 'InterTight',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color.fromRGBO(0, 0, 0, 0.50)),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 16)),
              Row(
                children: [
                  MaterialButton(
                    onPressed: () {
                      Get.toNamed('/information');
                    },
                    color: Colors.blue,
                    child: Icon(
                      PhosphorIcons.user_circle,
                      size: 20,
                      color: Colors.black,
                    ),
                    shape: CircleBorder(),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/information');
                    },
                    child: Text(
                      'Миний мэдээлэл',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'InterTight',
                          color: Colors.black),
                    ),
                  )
                ],
              ),
              // Row(
              //   children: [
              //     MaterialButton(
              //       onPressed: () {
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => TrophyScreen()));
              //       },
              //       color: Colors.orangeAccent,
              //       child: Icon(
              //         Icons.radar,
              //         size: 30,
              //         color: Colors.yellow,
              //       ),
              //       shape: CircleBorder(),
              //     ),
              //     TextButton(
              //       onPressed: () {
              //         Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => TrophyScreen()));
              //       },
              //       child: Text(
              //         'Амжилтууд',
              //         style: TextStyle(
              //             fontSize: 16,
              //             fontWeight: FontWeight.w500,
              //             fontStyle: FontStyle.normal,
              //             fontFamily: 'InterTight',
              //             color: Colors.black),
              //       ),
              //     )
              //   ],
              // ),
              Row(
                children: [
                  MaterialButton(
                    onPressed: () {
                      Get.toNamed('/privacy');
                    },
                    color: Colors.grey,
                    child: Icon(
                      PhosphorIcons.shield,
                      size: 20,
                      color: Colors.black,
                    ),
                    shape: CircleBorder(),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/privacy');
                    },
                    child: Text(
                      'Нууцлал',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'InterTight',
                          color: Colors.black),
                    ),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 25)),
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Миний хаяг',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'InterTight',
                            color: Color.fromRGBO(0, 0, 0, 0.50),
                          ),
                        )),
                    Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Бүртгэл солих',
                            style: TextStyle(
                                fontFamily: 'InterTight',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 160)),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed('/changeacc');
                            },
                            child: Text(
                              'Солих >',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'InterTight',
                                  color: Color.fromRGBO(0, 0, 0, 0.50)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 75, right: 25),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () {
                          showAlertDialog(context);
                        },
                        child: Text(
                          'Гарах',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontFamily: 'InterTight',
                            color: Color(0xffEC4F49),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: EdgeInsets.all(30),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
            content: SizedBox(
              width: 332,
              height: 126,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(top: 16)),
                  SizedBox(
                      width: 200,
                      height: 50,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Та гарах уу ?',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'InterTight',
                              color: Colors.black),
                        ),
                      )),
                ],
              ),
            ),
            actions: [
              Row(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)))),
                      onPressed: () {
                        Get.toNamed('/login');
                      },
                      child: Container(
                        width: 64,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25)),
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          'Тийм',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'InterTight',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )),
                  Padding(padding: EdgeInsets.only(left: 50)),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 64,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25)),
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          'Үгүй',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'InterTight',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ],
              ),
              // Padding(padding: EdgeInsets.only(right: 20)),

              // Padding(padding: EdgeInsets.only(right: 18))
            ],
          );
        });
  }
}
