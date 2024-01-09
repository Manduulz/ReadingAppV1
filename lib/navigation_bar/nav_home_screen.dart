import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class navHomeScreen extends StatefulWidget {
  const navHomeScreen({super.key});

  @override
  State<navHomeScreen> createState() => _navHomeScreenState();
}

class _navHomeScreenState extends State<navHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Color(0xffE8EFF5),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Material(
                    color: Colors.white,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(PhosphorIcons.magnifying_glass,
                            color: Colors.grey),
                        Expanded(
                          child: TextField(
                            // textAlign: TextAlign.center,
                            decoration: InputDecoration.collapsed(
                              hintText: '',
                            ),
                            onChanged: (value) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 390,
                height: 62,
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Text(
                      'Таны унших явц',
                      style: TextStyle(
                          fontFamily: 'InterTight',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    Padding(padding: EdgeInsets.only(left: 120)),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Засварлах',
                          style: TextStyle(
                              fontFamily: 'InterTight',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              // color: Color(0xff007CD680)
                              color: Color.fromRGBO(0, 124, 214, 0.50)),
                        ))
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 15,
                          offset: Offset(2, 4))
                    ]),
                child: SizedBox(
                  width: 350,
                  height: 127,
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 20)),
                      Container(
                        width: 83,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                                image: AssetImage('assets/images/onh.png'),
                                fit: BoxFit.fill)),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(32, 0, 0, 0)),
                      Column(
                        children: [
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Text(
                            'Өнхрүүш',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'InterTight',
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                color: Colors.black),
                          ),
                          Padding(padding: EdgeInsets.only(top: 8)),
                          Text(
                            'Үлгэрийн ном',
                            style: TextStyle(
                                fontFamily: 'InterTight',
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 0, 0, 0.50)),
                          ),
                          // Row(
                          //   children: [
                          //     Icon(Icons.star_outline),
                          //     Icon(Icons.star_outline),
                          //     Icon(Icons.star_outline),
                          //     Icon(Icons.star_outline),
                          //     Icon(Icons.star_outline),
                          //   ],
                          // )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              SizedBox(
                width: 390,
                height: 62,
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Text(
                      'Төстэй уншлага',
                      style: TextStyle(
                          fontFamily: 'InterTight',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    Padding(padding: EdgeInsets.only(left: 120)),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Дэлгэрэнгүй',
                          style: TextStyle(
                              fontFamily: 'InterTight',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              // color: Color(0xff007CD680)
                              color: Color.fromRGBO(0, 124, 214, 0.50)),
                        ))
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 15,
                          offset: Offset(2, 4))
                    ]),
                child: SizedBox(
                  width: 350,
                  height: 127,
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 20)),
                      Container(
                        width: 83,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            image: DecorationImage(
                                image: AssetImage('assets/images/onh.png'),
                                fit: BoxFit.fill)),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(32, 0, 0, 0)),
                      Column(
                        children: [
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Text(
                            'Өнхрүүш',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'InterTight',
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                color: Colors.black),
                          ),
                          Padding(padding: EdgeInsets.only(top: 8)),
                          Text(
                            'Үлгэрийн ном',
                            style: TextStyle(
                                fontFamily: 'InterTight',
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 0, 0, 0.50)),
                          ),
                          // Row(
                          //   children: [
                          //     Icon(Icons.star_outline),
                          //     Icon(Icons.star_outline),
                          //     Icon(Icons.star_outline),
                          //     Icon(Icons.star_outline),
                          //     Icon(Icons.star_outline),
                          //   ],
                          // )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              SizedBox(
                width: 390,
                height: 62,
                child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Text(
                      'Бусад',
                      style: TextStyle(
                          fontFamily: 'InterTight',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    Padding(padding: EdgeInsets.only(left: 200)),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Дэлгэрэнгүй',
                          style: TextStyle(
                              fontFamily: 'InterTight',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              // color: Color(0xff007CD680)
                              color: Color.fromRGBO(0, 124, 214, 0.50)),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
