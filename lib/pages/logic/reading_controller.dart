import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingappv1/pages/state/reading_state.dart';

class ReadingController extends GetxController {
  ReadingState state = ReadingState();
  Timer? timer;

  @override
  void onInit() {
    once(state.isDone, (isDone) {
      setContentText();
    });

    super.onInit();
  }

  List<TextSpan> setContentText() {
    for (var index = 0;
        index < state.bookData['contentText'].split(' ').length;
        index++) {
      state.content.add(
        TextSpan(
          text: '${state.bookData['contentText'].split(' ')[index]} ',
          style: const TextStyle(
            fontFamily: 'InterTight',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
            fontSize: 24,
          ),
        ),
      );
    }
    return state.content;
  }

  List<TextSpan> getContentText(int currentWordIndex) {
    state.content = [];
    for (var index = 0;
        index < state.bookData['contentText'].split(' ').length;
        index++) {
      state.content.add(
        TextSpan(
          text: '${state.bookData['contentText'].split(' ')[index]} ',
          style: TextStyle(
            fontFamily: 'InterTight',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: currentWordIndex == index ? Colors.black : Colors.grey,
          ),
        ),
      );
    }
    return state.content;
  }

  Future<void> onClickPlay() async {
    if (!state.isPlaying.value) {
      timer?.cancel();
    } else {
      timer?.cancel();
      state.readWords.value = 0;
      timer = Timer.periodic(0.5.seconds, (timer) {
        state.readWords.value++;
        getContentText(state.readWords.value);
        if (state.readWords.value ==
            state.bookData['contentText'].split(' ').length - 1) {
          timer.cancel();
        }
      });
    }
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
