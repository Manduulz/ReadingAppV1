import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';

void readingShowBottomSheet(BuildContext context) {
  RxDouble fontsize = RxDouble(16);
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
              color: Color(0xffE8EFF5),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              )),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Scaffold(
              backgroundColor: Color(0xffE8EFF5),
              appBar: AppBar(
                backgroundColor: Color(0xffE8EFF5),
                title: Text(
                  'Уншигчийн сонголт',
                  style: TextStyle(
                    fontFamily: "InterTight",
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                centerTitle: true,
                automaticallyImplyLeading: false,
                actions: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      PhosphorIcons.x_circle,
                      size: 24,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              body: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 60,
                                width: 120,
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Text(
                                    'Унших',
                                    style: TextStyle(
                                        fontFamily: 'InterTight',
                                        fontStyle: FontStyle.normal,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              Obx(() {
                                return Text(
                                  'Анивчих',
                                  style: TextStyle(
                                    fontSize: fontsize.value,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontFamily: 'InterTight',
                                    color: Colors.black,
                                  ),
                                );
                              })
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 60,
                                width: 120,
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Ном унших нь оюуны ',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontFamily: 'InterTight',
                                            fontSize: 8,
                                            fontStyle: FontStyle.normal
                                          )
                                        ),
                                        TextSpan(
                                          text: 'ертөнцөөр',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'InterTight',
                                              fontSize: 8,
                                              fontStyle: FontStyle.normal
                                          )
                                        ),
                                        TextSpan(
                                          text: ' аялуулж,орчлон ертөнцийг шинэ өнцгөөс харуулна.',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontFamily: 'InterTight',
                                                fontSize: 8,
                                                fontStyle: FontStyle.normal
                                            )
                                        )
                                      ]
                                    )
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Тодруулах',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'InterTight',
                                  color: Colors.black,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 2),
                          blurRadius: 2,
                        )
                      ]),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text('Текстийн хэмжээ'),
                              ),
                              Padding(padding: EdgeInsets.only(left: 10)),
                              Icon(PhosphorIcons.caret_circle_right),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 25,
                                height: 17,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(0, 124, 214, 0.20),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: InkWell(
                                  onTap: () {
                                    if (fontsize.value <= 10) return;
                                    fontsize.value--;
                                  },
                                  child: Text(
                                    'T',
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xff007CD6)),
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(left: 10)),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 30,
                                  height: 22,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(0, 124, 214, 0.20),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: InkWell(
                                    onTap: () {
                                      if (fontsize.value >= 40) return;
                                      fontsize.value++;
                                    },
                                    child: Text(
                                      'T',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff007CD6)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text('Үсгийн фонтууд'),
                              ),
                              Padding(padding: EdgeInsets.only(left: 10)),
                              Icon(PhosphorIcons.caret_circle_right),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 25,
                                height: 17,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(0, 124, 214, 0.20),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                child: InkWell(
                                  onTap: () {
                                    fontsize.value--;
                                  },
                                  child: Text(
                                    'A',
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xff007CD6)),
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(left: 10)),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 30,
                                  height: 22,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(0, 124, 214, 0.20),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  child: InkWell(
                                    onTap: () {
                                      log('clicked');
                                      fontsize.value++;
                                    },
                                    child: Text(
                                      'A',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff007CD6)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
