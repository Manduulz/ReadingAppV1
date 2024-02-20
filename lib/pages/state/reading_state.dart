import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class ReadingState {
  RxInt bookId = RxInt(0);
  RxMap<String, dynamic> bookData = RxMap({});
  List<TextSpan> content = RxList([]);
  RxInt readWords = RxInt(0);

  RxBool isPlaying = false.obs;
  RxBool isDone = false.obs;

  // Settings
  RxDouble slideValue = RxDouble(60);
  RxInt readerType = RxInt(0);
  RxDouble fontSize = RxDouble(24);
  RxInt fontType = RxInt(0);
}
