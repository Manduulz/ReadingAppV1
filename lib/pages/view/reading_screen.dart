import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:readingappv1/pages/logic/reading_controller.dart';

import '../../reading_screens/reading_screen_settings.dart';

class ReadingScreen extends StatefulWidget {
  const ReadingScreen({Key? key}) : super(key: key);

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  late Map<String, dynamic>? _rxMap;

  late int _bookId;

  @override
  void initState() {
    super.initState();
    _rxMap = Get.arguments["book"];
    _bookId = int.parse(Get.arguments["id"]);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ReadingController(context),
        builder: (ReadingController controller) {
          controller.state.bookData.value = _rxMap ?? {};
          controller.state.isDone.value = true;
          controller.state.bookId.value = _bookId;

          return Obx(() {
            Widget readerContent;

            if (controller.state.isPlaying.value) {
              readerContent = controller.state.readerType == RxInt(0)
                  ? Center(
                      child: RichText(
                        text: controller
                            .state.content[controller.state.readWords.value],
                      ),
                    )
                  : SingleChildScrollView(
                      child: RichText(
                        text: TextSpan(
                          children: controller.state.content,
                        ),
                      ),
                    );
            } else {
              readerContent = SingleChildScrollView(
                child: RichText(
                  text: TextSpan(
                    children: controller.state.content,
                  ),
                ),
              );
            }

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
                    color: Color(0xff343330),
                    size: 35,
                  ),
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        readingShowBottomSheet(context, () {
                          setState(() {});
                        });
                      },
                      icon: const Icon(
                        PhosphorIcons.gear,
                        color: Color(0xff343330),
                        size: 35,
                      ))
                ],
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text(
                            'Хурд (Үг/Мин) :',
                            style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'InterTight',
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${controller.state.slideValue.value.toInt()}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'InterTight',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      IgnorePointer(
                        ignoring: controller.state.isPlaying.value,
                        child: Slider(
                          min: 0,
                          max: 250,
                          divisions: 50,
                          label: controller.state.slideValue.value.toString(),
                          value: controller.state.slideValue.value,
                          onChanged: (double value) {
                            controller.state.slideValue.value = value;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: kToolbarHeight / 2,
                      ),
                      Row(
                        children: [
                          const Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              'Үйл явц :',
                              style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'InterTight',
                                  color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
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
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        width: double.maxFinite,
                        child: Card(
                          elevation: 20,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: readerContent),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor:
                    controller.state.isPlaying.value ? Colors.red : Colors.blue,
                onPressed: () {
                  controller.state.isPlaying.value =
                      !controller.state.isPlaying.value;
                  controller.onClickPlay();

                  if (controller.speakingState.isPlaying.value) {
                    controller.stopRecorder();
                  } else {
                    controller.record();
                  }
                  controller.speakingState.isPlaying.value =
                      !controller.speakingState.isPlaying.value;
                },
                child: Icon(
                  controller.state.isPlaying.value
                      ? PhosphorIcons.stop
                      : PhosphorIcons.microphone,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            );
          });
        });
  }
}
