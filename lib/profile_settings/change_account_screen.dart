import 'package:flutter/material.dart';

class ChangeAccounts extends StatefulWidget {
  const ChangeAccounts({super.key});

  @override
  State<ChangeAccounts> createState() => _ManageAccountsState();
}

class _ManageAccountsState extends State<ChangeAccounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffE8EFF5),
        centerTitle: true,

        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(kToolbarHeight),
        //   child: Padding(padding: const EdgeInsets.all(20.0)),
        // ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Color(0xff34333080),
          ),
        ),
        title: Text(
          'Бүртгэл солих',
          style: TextStyle(
              fontFamily: 'InterTight',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color.fromRGBO(52, 51, 48, 0.50)),
        ),
      ),
    );
  }
}
