import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingappv1/API/API.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final dio = Dio();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  RxBool isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          return Padding(
            padding: const EdgeInsets.only(right: 45.0, left: 45),
            child: isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(padding: EdgeInsets.only(top: 100)),
                            const Text(
                              'Нэвтрэх',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black, fontSize: 24, fontFamily: 'InterTight', fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 70),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'И-Мэйл, Утасны дугаар',
                              ),
                            ),
                            const SizedBox(height: 6),
                            SizedBox(
                              width: 330,
                              height: 50,
                              child: TextField(
                                controller: _emailController,
                                style: const TextStyle(color: Color.fromRGBO(0, 124, 214, 0.50)),
                                decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xffE2E8F0),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(color: Colors.lightBlueAccent),
                                    ),
                                    hintStyle: TextStyle(color: Colors.white)),
                              ),
                            ),
                            const Align(alignment: Alignment.centerLeft, child: Text('Нууц үг')),
                            const SizedBox(height: 6),
                            SizedBox(
                              width: 330,
                              height: 50,
                              child: TextField(
                                obscureText: true,
                                controller: _passwordController,
                                style: const TextStyle(color: Color.fromRGBO(0, 124, 214, 0.50)),
                                decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xffE2E8F0),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(15)), borderSide: BorderSide(color: Colors.lightBlueAccent)),
                                    hintStyle: TextStyle(color: Colors.white)),
                              ),
                            ),
                            const SizedBox(height: 40),
                            TextButton(
                              onPressed: () {
                                Get.toNamed('forgotpassword');
                              },
                              child: const Text(
                                'Нууц үг мартсан',
                                style: TextStyle(
                                    color: Color(0xff007CD6),
                                    fontFamily: 'InterTight',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal),
                              ),
                            ),
                            const SizedBox(height: 25),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromRGBO(0, 124, 214, 0.50),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                                onPressed: () {
                                  // login();
                                  Get.toNamed('/loading');
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 280,
                                  height: 50,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
                                  child: const Text(
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
                            const SizedBox(height: 25),
                            TextButton(
                              onPressed: () {
                                Get.toNamed('/signup');
                              },
                              child: const Text(
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
                      )
                    ],
                  ),
          );
        }),
      ),
    );
  }

  Future<void> login() async {
    isLoading.value = true;

    dynamic response = await LoginRepository().authenticate(
      username: 'Oyu@test.com',
      password: 'Ireedui123',
    );
    // dynamic response = await ApiHelper.instance.sendHttpRequest(
    //   urlPath: '/api/connect/token',
    //   contentType: 'text/plain',
    //   method: Method.post,
    //   body: {
    //     "grant_type": "password",
    //     "UserName": 'setgelll1212@gmail.com',
    //     "Password": '123456',
    //     "client_id": "user",
    //     "admin"
    //         "client_secret": "291bf515-3684-4c37-bd1a-59325e76810b",
    //     "37f8002c-2206-4182-8278-c2af7b5aa108"
    //         "scope": "offline_access"
    //   },
    // );
    isLoading.value = false;

    log('response : $response');

    // log('isSuccess : $isSuccess , response : $response');

    /// TODO : what to do after login
  }
}
