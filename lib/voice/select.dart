import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:flutter/material.dart';

class _SelectVoiceActionScreenState extends State<SelectVoiceActionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: TextButton(
          onPressed: (){},
          child: Row(children: [
            Icon(
              PhosphorIcons.caret_left,
              color: Colors.black,
            ),
            Text(
              'Back',
              style: TextStyle(color: Colors.black),
            )
          ],),
        ),
      ),
      body: Column(children: [
        Expanded(
            child: InkWell(
              onTap: (){},
              child: Container(
                margin: EdgeInsets.all(20),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1,color: Color(0xFFE2E8F0)),
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(1,1),
                      radius: 1,
                      colors: [Color(0xFFFEE2E2), Color(0x00FEE2E2)],
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Speak',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Donate your voice',
                            style: TextStyle(
                              color: Colors.black12,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: ShapeDecoration(
                              color: Color(0xFFEF4444),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x7FEF4444),
                                  blurRadius: 20,
                                  offset: Offset(0, 0),
                                  spreadRadius: 0,
                                )
                              ]
                            ),
                            child: Icon(
                              PhosphorIcons.microphone,
                              color: Colors.white,
                              size: 30,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
        ),
        Expanded(
            child: InkWell(
              onTap: (){},
              child: Container(
                margin: EdgeInsets.only(left: 20, bottom: 20,right: 20),
                decoration: ShapeDecoration(
                  color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFE2E9F0)),
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment(1,1),
                        radius: 1,
                        colors: [Color(0xFFDCFCE7), Color(0x00DCFCE7)],
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Listen',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Help us validate voices',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: ShapeDecoration(
                              color: Color(0xFF22C55E),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x7F22C55E),
                                  blurRadius: 20,
                                  offset: Offset(0, 0),
                                  spreadRadius: 0,
                                )
                              ]
                            ),
                            child: Icon(
                              PhosphorIcons.headphones,
                              color: Colors.white,
                              size: 30,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
        )
      ],),
    );
  }
}

class SelectVoiceActionScreen extends StatefulWidget {
  const SelectVoiceActionScreen({super.key});

  @override
  State<SelectVoiceActionScreen> createState() => _SelectVoiceActionScreenState();
}
