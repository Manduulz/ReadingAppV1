import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  int? _password;
  int? _newPassword;
  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _newPasswordController.dispose();
  }

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
          'Нууцлал',
          style: TextStyle(
              fontFamily: 'InterTight',
              fontWeight: FontWeight.w600,
              fontSize: 24,
              fontStyle: FontStyle.normal,
              color: Color.fromRGBO(0, 0, 0, 0.50)),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 32, bottom: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Нууц үг солих',
                  style: TextStyle(
                      fontFamily: 'InterTight',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      color: Color.fromRGBO(0, 0, 0, 0.50)),
                ),
              ),
            ),
            SizedBox(
              width: 330,
              height: 51,
              child: TextField(
                obscureText: true,
                controller: _passwordController,
                style: TextStyle(color: Color.fromRGBO(0, 124, 214, 0.50)),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      PhosphorIcons.lock_simple,
                      color: Color.fromRGBO(0, 0, 0, 0.50),
                    ),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xffE2E8F0),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(0, 0, 0, 0.50))),
                    hintText: 'Хуучин Нууц Үг',
                    hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.50))),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 330,
              height: 51,
              child: TextField(
                obscureText: true,
                controller: _newPasswordController,
                style: TextStyle(color: Color.fromRGBO(0, 124, 214, 0.50)),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      PhosphorIcons.lock_simple,
                      color: Color.fromRGBO(0, 0, 0, 0.50),
                    ),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color(0xffE2E8F0),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(0, 0, 0, 0.50))),
                    hintText: 'Шинэ Нууц Үг',
                    hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.50))),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff007CD6),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                onPressed: () {},
                child: Container(
                  width: 280,
                  height: 50,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(2)),
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Хадгалах',
                    style: TextStyle(
                      fontFamily: 'InterTight',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
