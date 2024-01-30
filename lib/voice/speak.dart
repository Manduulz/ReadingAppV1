import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_player.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:permission_handler/permission_handler.dart';

class SpeakScreen extends StatefulWidget {
  const SpeakScreen({super.key});

  @override
  State<SpeakScreen> createState() => _SpeakScreenState();
}

class _SpeakScreenState extends State<SpeakScreen> {
  late FlutterSoundPlayer audioPlayer;
  late FlutterSoundRecorder recorder;
  bool isRecorderReady = false;
  File? audioFile;
  bool isRecording = false;

  @override
  void initState() {
    super.initState();
    requestMicrophonePermission();
    initRecorder();
    initAudioPlayer();
  }

  @override
  void dispose() {
    super.dispose();
    recorder.closeRecorder();
    audioPlayer.closePlayer();
  }

  Future<void> requestMicrophonePermission() async {
    final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted) {
      throw 'Microphone permission not granted';
    }
    isRecorderReady = true;
  }

  Future initAudioPlayer() async {
    audioPlayer = FlutterSoundPlayer();

    await audioPlayer.openPlayer();
  }

  Future initRecorder() async {
    recorder = FlutterSoundRecorder();

    await recorder.openRecorder(); // openPlayer bish openRecorder bh estoi
  }

  Future startRecord() async {
    requestMicrophonePermission();
    if (!isRecorderReady) return;

    await recorder.startRecorder();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
