import 'dart:async';
import 'package:flutter_sound/flutter_sound.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:readingappv1/pages/speaking_screen/state/speaking_state.dart';
import 'package:readingappv1/pages/state/reading_state.dart';

class ReadingController extends GetxController {
  ReadingState state = ReadingState();
  Timer? timer;
  SpeakingState speakingState = SpeakingState();

  @override
  void onInit() {
    once(state.isDone, (isDone) {
      setContentText();
    });
    initializer();
    super.onInit();
  }

  void initializer() async {
    await speakingState.recordingSession.openRecorder();
    await speakingState.myPlayer.openPlayer();
  }

  Future<void> record() async {
    await Permission.microphone.request();

    final directory = await getApplicationDocumentsDirectory();

    String pathToAudio = '/${directory.path}/temp.aac';

    speakingState.path = pathToAudio;

    await speakingState.recordingSession.startRecorder(
      toFile: pathToAudio,
      codec: Codec.aacADTS,
    );
  }

  void play() async {
    await speakingState.myPlayer.startPlayer(
      fromURI: speakingState.path,
      codec: Codec.aacADTS
    );
  }

  void stopplayer() {
    speakingState.myPlayer.stopPlayer();
  }

  Future<void> stopRecorder() async {
    await speakingState.recordingSession.stopRecorder();
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
  @override
  void dispose() {
    speakingState.myPlayer.closePlayer();
    speakingState.recordingSession.closeRecorder();
    super.dispose();
  }
}
