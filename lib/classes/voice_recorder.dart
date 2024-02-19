import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class VoiceRecorder extends StatefulWidget {
  const VoiceRecorder({super.key});

  @override
  State<VoiceRecorder> createState() => _VoiceRecorderState();
}

class _VoiceRecorderState extends State<VoiceRecorder> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final String _audioPath = "path/to/your/audio/file";
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    _initAudioPlayer();
  }

  Future<void> _initAudioPlayer() async {
    await _audioPlayer.setSourceUrl(_audioPath);
  }

  Future<void> _startRecording() async {
    if (await Permission.microphone.request().isGranted) {
      // Start recording logic here
      setState(() {
        _isRecording = true;
      });
    } else {
      // Handle permission not granted
    }
  }

  Future<void> _stopRecording() async {
    // Stop recording logic here
    setState(() {
      _isRecording = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voice Recorder'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_isRecording ? 'Recording...' : 'Tap to Record'),
            const SizedBox(height: 20),
            IconButton(
              icon: Icon(_isRecording ? Icons.stop : Icons.mic),
              iconSize: 48,
              onPressed: _isRecording ? _stopRecording : _startRecording,
            ),
          ],
        ),
      ),
    );
  }
}
