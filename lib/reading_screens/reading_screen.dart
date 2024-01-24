import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:readingappv1/classes/play_stop.dart';

class ReadingScreen extends StatefulWidget {
  final dynamic data;
  const ReadingScreen({required this.data, super.key});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  @override
  Widget build(BuildContext context) {
    log('data : ${widget.data}');

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xffE8EFF5),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            PhosphorIcons.arrow_left,
            color: Color(0xff34333080),
            size: 35,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                PhosphorIcons.gear,
                color: Color(0xff34333080),
                size: 35,
              ))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 15)),
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Үйл явц',
                style:
                    TextStyle(fontStyle: FontStyle.normal, fontSize: 18, fontWeight: FontWeight.w400, fontFamily: 'InterTight', color: Colors.black),
              ),
            ),
            Container(
              height: 5,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.blue,
              margin: const EdgeInsets.symmetric(vertical: 10),
            ),
            const Center(
              child: Text(
                '175 / 350',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'InterTight',
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              width: 390,
              height: 367,
              child: Center(
                child: Text(
                  widget.data['contentText'],
                  style: const TextStyle(
                    fontFamily: 'InterTight',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  const Text(
                    'Хурд (Үг/Мин)',
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'InterTight',
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    '100',
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'InterTight',
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    width: 300,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Slider(
                            value: 0,
                            onChanged: (double value) {
                              setState(() {});
                            }),
                      ],
                    ),
                  ),
                  Container(
                    width: 68,
                    height: 68,
                    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(55)),
                    child: const PlayStopButton(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
