import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:readingappv1/buttons.dart';

class ListenScreen extends StatefulWidget {
  const ListenScreen({super.key});

  @override
  State<ListenScreen> createState() => _ListenScreenState();
}

class _ListenScreenState extends State<ListenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: TextButton(
          onPressed: (){},
          child: const Row(children: [
            Icon(
              PhosphorIcons.caret_left,
              color: Colors.black,
            ),
            Text(
              'Speak',
              style: TextStyle(color: Colors.black),
            )
          ],),
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Today's progress",
                  style: TextStyle(
                    color: Colors.black12,
                    fontSize: 12,
                    fontWeight: FontWeight.w400
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '9',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        )
                      ),
                      TextSpan(
                        text: '/20 Clips recorded',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )
                      )
                    ]
                  )
                )
              ],
            )
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
                  PhosphorIcons.play,
                  color: Color(0xFF22C55E),
                  size: 17,
                ),
              ),
              const Text(
                'then listen',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              )
            ],
          ),
          const Text(
            'Did they accurately speak the sentence?',
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(30),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3FCBD5E1),
                      blurRadius: 10,
                      offset: Offset(0,4),
                      spreadRadius: 0,
                    )
                  ],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
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
              )
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            alignment: Alignment.center,
            child: Container(
              width: 70,
              height: 70,
              decoration: ShapeDecoration(
                color: const Color(0xFF22C55E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                shadows: [
                  const BoxShadow(
                    color: Color(0x7F22C55E),
                    blurRadius: 20,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                  )
                ]
              ),
              child: IconButton(
                onPressed: (){},
                icon: const Icon(
                  PhosphorIcons.play,
                  color: Colors.white,
                    size: 30,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: ButtonWithTextAndIcon(
                      text: 'Correct',
                      type: 'Secondary',
                      size: 'default',
                      icon: PhosphorIcons.thumbs_up,
                      onPressed: (){},
                    )
                ),
                const SizedBox(height: 20),
                Expanded(
                    child: ButtonWithTextAndIcon(
                      text: 'Incorrect',
                      type: 'secondary',
                      size: 'default',
                      icon: PhosphorIcons.thumbs_down,
                      onPressed: (){},
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
