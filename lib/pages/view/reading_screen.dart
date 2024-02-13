import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:readingappv1/pages/logic/reading_controller.dart';

import '../../reading_screens/reading_screen_settings.dart';

///TODO: change statefull to stateless
///TODO : stateless dotor icon change button nemj chadahgui bna :)),
class ReadingScreen extends StatefulWidget {
  const ReadingScreen({Key? key}) : super(key: key);

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  double _currentSliderValue = 0;
  bool isPlaying = false;
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
              return SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 15)),
                      const Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Үйл явц',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'InterTight',
                              color: Colors.black),
                        ),
                      ),
                      // Slider(
                      //   value: _currentSliderValue,
                      //   min: 0,
                      //   max: 49,
                      //   divisions: 10,
                      //   label: _currentSliderValue.round().toString(),
                      //   activeColor: Colors.blue, // Set the color of the active part of the slider line
                      //   inactiveColor: Colors.grey, // Set the color of the inactive part of the slider line
                      //   onChanged: (double value) {
                      //     setState(() {
                      //       _currentSliderValue = value;
                      //     });
                      //   },
                      // ),
                      ///TODO: line slider add !!
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
                              '${controller.state.slideValue.value}',
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
                                    max: 250,
                                    divisions: 50,
                                    label: _currentSliderValue.round().toString(),
                                    value: controller.state.slideValue.value,
                                    onChanged: (double value) {
                                      controller.state.slideValue.value = value;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.state.isPlaying.value =
                                    !controller.state.isPlaying.value;
                                controller.onClickPlay();
                                setState(() {
                                  isPlaying = !isPlaying;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(55)),
                                height: 50,
                                width: 50,
                                child: Icon(
                                  isPlaying
                                      ? PhosphorIcons.stop
                                      : PhosphorIcons.microphone,
                                  size: 28,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            // Container(
                            //   decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(55)),
                            //   child: const PlayStopButton(),
                            // ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          );
        });
  }
}
