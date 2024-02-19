import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:readingappv1/pages/logic/reading_controller.dart';

void readingShowBottomSheet(BuildContext context, Function() dismiss) {
  final ReadingController readingController =
      Get.put(ReadingController(context));

  showModalBottomSheet(
      context: context,
      isDismissible: false,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
              color: Color(0xffE8EFF5),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              )),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Scaffold(
              backgroundColor: const Color(0xffE8EFF5),
              appBar: AppBar(
                backgroundColor: const Color(0xffE8EFF5),
                title: const Text(
                  'Уншигчийн тохиргоо',
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
                      dismiss();
                      readingController.setContentText();
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      PhosphorIcons.x_circle,
                      size: 24,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Уншигчийн төрөл',
                        style: TextStyle(
                          fontFamily: "InterTight",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: Obx(() {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  readingController.state.readerType.value = 0;
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: readingController
                                                      .state.readerType ==
                                                  RxInt(0)
                                              ? Colors.red
                                              : Colors.grey,
                                          width: readingController
                                                      .state.readerType ==
                                                  RxInt(0)
                                              ? 2
                                              : 1),
                                      shape: BoxShape.rectangle,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 60,
                                          width: 120,
                                          child: Container(
                                            alignment: Alignment.center,
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15))),
                                            child: const Text(
                                              'Унших',
                                              style: TextStyle(
                                                  fontFamily: 'InterTight',
                                                  fontStyle: FontStyle.normal,
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        const Text(
                                          'Анивчих',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            fontStyle: FontStyle.normal,
                                            fontFamily: 'InterTight',
                                            color: Colors.black,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  readingController.state.readerType.value = 1;
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: readingController
                                                      .state.readerType ==
                                                  RxInt(1)
                                              ? Colors.red
                                              : Colors.grey,
                                          width: readingController
                                                      .state.readerType ==
                                                  RxInt(1)
                                              ? 2
                                              : 1),
                                      shape: BoxShape.rectangle,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 60,
                                          width: 120,
                                          child: Container(
                                            padding: const EdgeInsets.all(5),
                                            alignment: Alignment.center,
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15))),
                                            child: const Text.rich(
                                                TextSpan(children: [
                                              TextSpan(
                                                  text: 'Ном унших нь оюуны ',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontFamily: 'InterTight',
                                                      fontSize: 8,
                                                      fontStyle:
                                                          FontStyle.normal)),
                                              TextSpan(
                                                  text: 'ертөнцөөр',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'InterTight',
                                                      fontSize: 8,
                                                      fontStyle:
                                                          FontStyle.normal)),
                                              TextSpan(
                                                  text:
                                                      ' аялуулж,орчлон ертөнцийг шинэ өнцгөөс харуулна.',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontFamily: 'InterTight',
                                                      fontSize: 8,
                                                      fontStyle:
                                                          FontStyle.normal))
                                            ])),
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        const Text(
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
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        })),
                    Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 40,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Текстийн хэмжээ: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Obx(() {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Жишээ',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: readingController
                                            .state.fontSize.value,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontFamily: 'InterTight',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5),
                            child: VerticalDivider(
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 25,
                            height: 17,
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(0, 124, 214, 0.20),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: InkWell(
                              onTap: () {
                                if (readingController.state.fontSize.value <=
                                    10) return;
                                readingController.state.fontSize.value--;
                              },
                              child: const Text(
                                'T',
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xff007CD6)),
                              ),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(left: 10)),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              alignment: Alignment.center,
                              width: 30,
                              height: 22,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(0, 124, 214, 0.20),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: InkWell(
                                onTap: () {
                                  if (readingController.state.fontSize.value >=
                                      40) return;
                                  readingController.state.fontSize.value++;
                                },
                                child: const Text(
                                  'T',
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xff007CD6)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 40,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Үсгийн фонтууд:',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Obx(() {
                              int fontType =
                                  readingController.state.fontType.value;
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Жишээ',
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: fontType == 2
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                        fontStyle: fontType == 1
                                            ? FontStyle.italic
                                            : FontStyle.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(5),
                            child: VerticalDivider(
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 25,
                            height: 17,
                            decoration: const BoxDecoration(
                                color: Color.fromRGBO(0, 124, 214, 0.20),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: InkWell(
                              onTap: () {
                                if (readingController.state.fontType.value <
                                    0) {
                                  readingController.state.fontType.value = 2;
                                  return;
                                }
                                readingController.state.fontType.value--;
                              },
                              child: const Text(
                                'A',
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xff007CD6)),
                              ),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.only(left: 10)),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              alignment: Alignment.center,
                              width: 30,
                              height: 22,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(0, 124, 214, 0.20),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: InkWell(
                                onTap: () {
                                  log('clicked');
                                  if (readingController.state.fontType.value >
                                      2) {
                                    readingController.state.fontType.value = 0;
                                    return;
                                  }
                                  readingController.state.fontType.value++;
                                },
                                child: const Text(
                                  'A',
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xff007CD6)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(0, 124, 214, 0.50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        onPressed: () {
                          dismiss();
                          readingController.setContentText();
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                'Хадгалах',
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
      });
}
