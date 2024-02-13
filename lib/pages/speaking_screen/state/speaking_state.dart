import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';

class SpeakingState {
  RxBool isPlaying = false.obs;
  final FlutterSoundRecorder recordingSession = FlutterSoundRecorder();
  final FlutterSoundPlayer myPlayer = FlutterSoundPlayer();
  late String path;
}
