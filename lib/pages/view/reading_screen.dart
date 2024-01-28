import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:readingappv1/pages/logic/reading_controller.dart';

import '../../classes/play_stop.dart';
import '../../reading_screens/reading_screen_settings.dart';

class ReadingScreen extends StatelessWidget {
  const ReadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ReadingController(),
        builder: (ReadingController controller) {
          controller.state.bookData.value = Get.arguments;

          controller.state.isDone.value = true;

          // for (var index = 0; index < controller.state.bookData['contentText'].split(' ').length; index++) {
          //   controller.state.content.add(controller.state.bookData['contentText'][index]);
          // }

          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: const Color(0xffE8EFF5),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  PhosphorIcons.arrow_left,
                  color: Color(0xff34333080),
                  size: 35,
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      readingShowBottomSheet(context);
                    },
                    icon: const Icon(
                      PhosphorIcons.gear,
                      color: Color(0xff34333080),
                      size: 35,
                    ))
              ],
            ),
            body: Obx(() {
              return SafeArea(
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 15)),
                    const Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Үйл явц',
                        style: TextStyle(
                            fontStyle: FontStyle.normal, fontSize: 18, fontWeight: FontWeight.w400, fontFamily: 'InterTight', color: Colors.black),
                      ),
                    ),
                    Container(
                      height: 5,
                      width: MediaQuery.of(context).size.width * 0.8,
                      color: Colors.grey,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                    ),
                    Center(
                      child: Text(
                        '${controller.state.readWords} / ${controller.state.bookData['contentText'].split(' ').length - 1}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'InterTight',
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        height: 300,
                        child: Card(
                          elevation: 20,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Center(
                                child: RichText(
                                  text: TextSpan(
                                    children: controller.state.content,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          const Text(
                            'Хурд (Үг/Мин)',
                            style: TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'InterTight',
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '${controller.state.readWords}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'InterTight',
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Slider(
                                  min: 0,
                                  max: 100,
                                  value: controller.state.slideValue.value,
                                  onChanged: (double value) {
                                    controller.state.slideValue.value = value;
                                  },
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.state.isPlaying.value = !controller.state.isPlaying.value;

                              controller.onClickPlay();
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              color: Colors.amber,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(55)),
                            child: const PlayStopButton(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
          );
        });
  }
}
