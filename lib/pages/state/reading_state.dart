import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadingState {
  RxDouble slideValue = RxDouble(60);
  RxMap<String, dynamic> bookData = RxMap({});
  RxInt readWords = RxInt(0);
  RxBool isPlaying = false.obs;
  List<TextSpan> content = RxList([]);

  RxBool isDone = false.obs;

  // Settings
  RxInt readerType = RxInt(0);
  RxDouble fontSize = RxDouble(24);
  RxInt fontType = RxInt(0);
}
