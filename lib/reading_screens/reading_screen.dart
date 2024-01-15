import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class ReadingScreen extends StatefulWidget {
  const ReadingScreen({super.key});

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffE8EFF5),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            PhosphorIcons.arrow_left,
            color: Color(0xff34333080),
            size: 35,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                PhosphorIcons.gear,
                color: Color(0xff34333080),
                size: 35,
              ))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 15)),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Үйл явц',
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'InterTight',
                    color: Colors.black),
              ),
            ),
            Container(
              height: 5,
              width: MediaQuery.of(context).size.width * 0.8,
              color: Colors.blue,
              margin: EdgeInsets.symmetric(vertical: 10),
            ),
            Center(
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
                  'Lorem',
                  style: TextStyle(
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
                  Text(
                    'Хурд (Үг/Мин)',
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'InterTight',
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '100',
                    style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'InterTight',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
