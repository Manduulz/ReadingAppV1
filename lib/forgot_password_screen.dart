import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  int? _password;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Text(
                'Нууц үг сэргээх',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'InterTight',
                    fontSize: 24,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Та зөвхөн бүртгэлтэй И-Мейл хаяг оруулна уу',
                style: TextStyle(
                  fontFamily: 'InterTight',
                ),
              ),
              SizedBox(height: 160),
              SizedBox(
                width: 330,
                height: 51,
                child: TextField(
                  controller: _emailController,
                  style: TextStyle(color: Color.fromRGBO(0, 124, 214, 0.50)),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email,
                          color: Color.fromRGBO(0, 124, 214, 0.50)),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: Colors.lightBlueAccent)),
                      hintText: 'Бүртгэлтэй И-Мейл',
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(0, 124, 214, 0.50))),
                ),
              ),
              SizedBox(height: 140),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(0, 124, 214, 0.50),
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
                      'Бүртгэл сэргээх',
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
      ),
    );
  }
}
