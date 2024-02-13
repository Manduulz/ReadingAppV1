import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:readingappv1/buttons.dart';

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

    log('status : $status');

    if (status != PermissionStatus.granted) {
      openAppSettings();
      throw 'Microphone permission not granted';
    } else {
      isRecorderReady = true;
    }
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
    await requestMicrophonePermission();
    if (!isRecorderReady) return;

    await recorder.startRecorder(toFile: 'audio');

    setState(() {
      isRecording = true;
    });
  }

  Future stopRecord() async {
    if (!isRecorderReady) return;

    final path = await recorder.stopRecorder();
    setState(() {
      audioFile = File(path!);
      isRecording = false;
    });
  }

  Future<void> playAudio() async {
    if (audioFile == null) return;

    await audioPlayer.startPlayer(
      fromURI: audioFile!.path,
      codec: Codec.pcm16WAV,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: TextButton(
          onPressed: () {},
          child: const Row(
            children: [
              Icon(
                PhosphorIcons.caret_left,
                color: Colors.black,
              ),
              Text(
                'Speak',
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Today's Progress",
              style: TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400),
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                text: '9',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                  text: '/20 Clips recorded',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ))
            ]))
          ],
        ),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Click',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: const Icon(
                  PhosphorIcons.microphone,
                  color: Color(0xFFEF4444),
                  size: 17,
                ),
              ),
              const Text(
                'then read the sentence aloud',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              )
            ],
          ),
          const SizedBox(height: 30),
          Expanded(
              child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(30),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
                color: Colors.white,
                shadows: [
                  const BoxShadow(
                    color: Color(0x3FCBD5E1),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: const Text(
                'The family also shifts to Ramapuram',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          )),
          const SizedBox(height: 30),
          audioFile != null ? const Text('Successfully recorded!') : Container(),
          audioFile != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonWithIcon(
                      onPressed: () async {
                        await playAudio();
                      },
                      icon: PhosphorIcons.play_bold,
                      size: 'small',
                      type: 'secondary',
                    ),
                    const SizedBox(width: 30),
                    ButtonWithIcon(
                      onPressed: () {
                        setState(() {
                          audioFile = null;
                        });
                      },
                      icon: PhosphorIcons.arrow_counter_clockwise_bold,
                      size: 'small',
                      type: 'secondary',
                    )
                  ],
                )
              : const SizedBox(height: 68),
          const SizedBox(height: 30),
          IconButton(
            style: IconButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: const Color(0xFFEF4444),
              disabledBackgroundColor: const Color.fromRGBO(40, 239, 68, 68),
              padding: const EdgeInsets.all(20),
            ),
            onPressed: audioFile == null
                ? () async {
                    if (isRecording) {
                      await stopRecord();
                    } else {
                      await startRecord();
                    }
                  }
                : null,
            icon: Icon(
              isRecording ? PhosphorIcons.stop : PhosphorIcons.microphone,
              color: Colors.white,
              size: 30,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            alignment: Alignment.center,
            child: ButtonWithTextAndIcon(
              onPressed: audioFile == null ? null : () {},
              type: 'primary',
              size: 'default',
              text: 'Submit',
            ),
          )
        ],
      ),
    );
  }
}
