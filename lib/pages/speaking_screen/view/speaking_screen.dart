import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingappv1/pages/speaking_screen/logic/speaking_controller.dart';

class SpeakingScreen extends StatelessWidget {
  const SpeakingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SpeakingController(),
      builder: (controller) {
        return Scaffold(
          body: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                const Text('Speaking Screen'),
                const SizedBox(height: 40),
                Center(
                  child: InkWell(
                    onTap: () {
                      controller.state.isPlaying.value ? controller.stopRecorder() : controller.record();
                      controller.state.isPlaying.value = !controller.state.isPlaying.value;
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                      decoration: BoxDecoration(
                        color: controller.state.isPlaying.value ? Colors.red : Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        controller.state.isPlaying.value ? 'Stop' : 'Play',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    controller.play();
                  },
                  child: const Text('Play your record'),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    controller.stopPlayer();
                  },
                  child: const Text('Stop your record'),
                ),
              ],
            );
          }),
        );
      },
    );
  }
}
