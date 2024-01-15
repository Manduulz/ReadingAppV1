import 'package:api_provider/api_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final apiProvider = ApiProvider(
      baseUrl:
          'https://speedreaderbackend.azurewebsites.net/swagger/index.html');

  final dio = Dio();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _email;
  int? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 45.0, left: 45),
          child: Column(
            children: [
              Center(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 100)),
                      Text(
                        'Нэвтрэх',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontFamily: 'InterTight',
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 70),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'И-Мэйл, Утасны дугаар',
                        ),
                      ),
                      SizedBox(height: 6),
                      SizedBox(
                        width: 330,
                        height: 50,
                        child: TextField(
                          controller: _emailController,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 124, 214, 0.50)),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffE2E8F0),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(color: Colors.lightBlueAccent),
                              ),
                              hintStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Нууц үг')),
                      SizedBox(height: 6),
                      SizedBox(
                        width: 330,
                        height: 50,
                        child: TextField(
                          obscureText: true,
                          controller: _passwordController,
                          style: TextStyle(
                              color: Color.fromRGBO(0, 124, 214, 0.50)),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xffE2E8F0),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide: BorderSide(
                                      color: Colors.lightBlueAccent)),
                              hintStyle: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(height: 40),
                      TextButton(
                        onPressed: () {
                          Get.toNamed('forgotpassword');
                        },
                        child: Text(
                          'Нууц үг мартсан',
                          style: TextStyle(
                              color: Color(0xff007CD6),
                              fontFamily: 'InterTight',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                      SizedBox(height: 25),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromRGBO(0, 124, 214, 0.50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          onPressed: () {
                            Get.toNamed('/loading');
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 280,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2)),
                            child: Text(
                              textAlign: TextAlign.center,
                              'Нэвтрэх',
                              style: TextStyle(
                                fontFamily: 'InterTight',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          )),
                      SizedBox(height: 25),
                      TextButton(
                        onPressed: () {
                          Get.toNamed('/signup');
                        },
                        child: Text(
                          'Бүртгэл үүсгэх',
                          style: TextStyle(
                              color: Color(0xff007CD6),
                              fontFamily: 'InterTight',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
