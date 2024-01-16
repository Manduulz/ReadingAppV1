import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class PlayStopButton extends StatefulWidget {
  const PlayStopButton({super.key});

  @override
  State<PlayStopButton> createState() => _PlayStopButtonState();
}

class _PlayStopButtonState extends State<PlayStopButton> {
  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            isPlaying = !isPlaying;
          });
          //Add your play/stop logic here
        },
        icon: Icon(
          isPlaying ? PhosphorIcons.stop : PhosphorIcons.play,
          size: 28,
          color: Colors.white,
        ));
  }
}
