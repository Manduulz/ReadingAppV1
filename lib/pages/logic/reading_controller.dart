import 'dart:async';
import 'package:dio/dio.dart' as dio;
import 'package:flutter_sound/flutter_sound.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:readingappv1/pages/speaking_screen/state/speaking_state.dart';
import 'package:readingappv1/pages/state/reading_state.dart';
import 'package:readingappv1/service/api_helper.dart';
import 'package:readingappv1/service/method.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ReadingController extends GetxController {
  ReadingState state = ReadingState();
  Timer? timer;
  Timer? timerMinute;

  int durationInSeconds = 0;
  SpeakingState speakingState = SpeakingState();

  String? _recordingPath;
  BuildContext? context;

  ReadingController(BuildContext ctxt) {
    context = ctxt;
  }

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

    _recordingPath =
        '${directory.path}/recording_${DateTime.now().millisecondsSinceEpoch}.aac';

    speakingState.path = _recordingPath ?? '';

    await speakingState.recordingSession.startRecorder(
      toFile: _recordingPath,
      codec: Codec.aacADTS,
    );
  }

  void play() async {
    await speakingState.myPlayer
        .startPlayer(fromURI: speakingState.path, codec: Codec.aacADTS);
  }

  void stopplayer() {
    speakingState.myPlayer.stopPlayer();
  }

  Future<void> stopRecorder() async {
    await speakingState.recordingSession.stopRecorder();
  }

  List<TextSpan> setContentText() {
    state.content = [];
    int fontType = state.fontType.value;
    for (var index = 0;
        index < state.bookData['contentText'].split(' ').length;
        index++) {
      state.content.add(
        TextSpan(
          text: '${state.bookData['contentText'].split(' ')[index]} ',
          style: TextStyle(
            fontSize: state.fontSize.value,
            fontWeight: fontType == 2 ? FontWeight.bold : FontWeight.normal,
            fontStyle: fontType == 1 ? FontStyle.italic : FontStyle.normal,
            color: Colors.grey,
          ),
        ),
      );
    }
    return state.content;
  }

  List<TextSpan> getContentText(int currentWordIndex) {
    state.content = [];
    int fontType = state.fontType.value;
    for (var index = 0;
        index < state.bookData['contentText'].split(' ').length;
        index++) {
      state.content.add(
        TextSpan(
          text: '${state.bookData['contentText'].split(' ')[index]} ',
          style: TextStyle(
            fontSize: state.fontSize.value,
            fontWeight: fontType == 2 ? FontWeight.bold : FontWeight.normal,
            fontStyle: fontType == 1 ? FontStyle.italic : FontStyle.normal,
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
      timerMinute?.cancel();
    } else {
      timer?.cancel();
      timerMinute?.cancel();
      state.readWords.value = 0;

      double secondsInMilliseconds = 60000;
      double singleWordDurationInMilliseconds =
          secondsInMilliseconds / state.slideValue.value;

      durationInSeconds = 0;
      timerMinute = Timer.periodic(const Duration(seconds: 1), (timer) async {
        durationInSeconds++;
        if (durationInSeconds >= secondsInMilliseconds / 1000) {
          resetValue();
        }
      });

      getContentText(state.readWords.value);

      bool done = false;
      timer = Timer.periodic(
          Duration(milliseconds: singleWordDurationInMilliseconds.toInt()),
          (timer) {
        if (done) {
          return resetValue();
        }

        state.readWords.value++;

        getContentText(state.readWords.value);

        if (state.readWords.value ==
            state.bookData['contentText'].split(' ').length - 1) {
          done = true;
        }
      });
    }
  }

  void uploadAudio() async {
    if (_recordingPath == null || context == null) return;
    debugPrint("_recordingPath: $_recordingPath");

    context?.loaderOverlay.show();

    dio.MultipartFile file = await dio.MultipartFile.fromFile(
        _recordingPath ?? "",
        filename: _recordingPath?.split("/").last,
        contentType: MediaType("audio", "aac"));

    debugPrint("file.id: ${state.bookId.value}");
    debugPrint("file.length: ${file.length}");
    debugPrint("file.filename: ${_recordingPath?.split("/").last}");
    debugPrint(
        "DateTime.now().toIso8601String(): ${DateTime.now().toIso8601String()}");

    dio.FormData data = dio.FormData.fromMap(
      {
        "ContentId": state.bookId.value,
        "Text": file.filename,
        "AudioFile": file,
        "AudioDuration": 60,
        "Type": "Normal",
      },
    );

    for (var element in data.fields) {
      debugPrint(element.toString());
    }

    for (var element in data.files) {
      debugPrint(element.toString());
    }

    var (isSuccess, response) = await ApiHelper.instance
        .sendHttpRequestFormData(
            urlPath: '/api/data/add',
            contentType: 'multipart/form-data',
            method: Method.post,
            data: data)
        .catchError((error) {
      context?.loaderOverlay.hide();
      return (false, null);
    }).onError((error, stackTrace) async {
      context?.loaderOverlay.hide();
      return (false, null);
    });

    context?.loaderOverlay.hide();

    debugPrint("isSuccess: $isSuccess");
    debugPrint("response upload: $response");

    if (isSuccess) {
      showTopSnackBar(
        Overlay.of(context!),
        const CustomSnackBar.success(
          message: 'Аудио хадгалагдлаа.',
        ),
      );
    }
  }

  void resetValue() async {
    state.readWords.value = 0;
    state.isPlaying.value = false;

    timer?.cancel();
    timerMinute?.cancel();
    setContentText();

    speakingState.isPlaying.value = false;
    await stopRecorder();

    uploadAudio();
  }

  @override
  void onClose() {
    timer?.cancel();
    timerMinute?.cancel();
    super.onClose();
  }

  @override
  void dispose() {
    speakingState.myPlayer.closePlayer();
    speakingState.recordingSession.closeRecorder();
    super.dispose();
  }
}
