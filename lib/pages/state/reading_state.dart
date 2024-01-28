import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadingState {
  RxDouble slideValue = RxDouble(0);
  RxMap<String, dynamic> bookData = RxMap({});
  RxInt readWords = RxInt(0);
  RxBool isPlaying = false.obs;
  List<TextSpan> content = RxList([]);

  RxBool isDone = false.obs;
}
