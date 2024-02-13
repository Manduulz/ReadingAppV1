import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:readingappv1/pages/speaking_screen/state/speaking_state.dart';

class SpeakingController extends GetxController {
  SpeakingState state = SpeakingState();

  @override
  void onInit() {
    initializer();
    super.onInit();
  }

  void initializer() async {
    await state.recordingSession.openRecorder();
    await state.myPlayer.openPlayer();
  }

  Future<void> record() async {
    await Permission.microphone.request();

    final directory = await getApplicationDocumentsDirectory();

    /// TODO : temp-ийг нь bookId-гаар солих
    String pathToAudio = '/${directory.path}/temp.aac';

    state.path = pathToAudio;

    await state.recordingSession.startRecorder(
      toFile: pathToAudio,
      codec: Codec.aacADTS,
    );
  }

  void play() async {
    await state.myPlayer.startPlayer(
      fromURI: state.path,
      codec: Codec.aacADTS,
    );
  }

  void stopPlayer() {
    state.myPlayer.stopPlayer();
  }

  Future<void> stopRecorder() async {
    await state.recordingSession.stopRecorder();
  }

  @override
  void dispose() {
    state.myPlayer.closePlayer();
    state.recordingSession.closeRecorder();
    super.dispose();
  }
}
