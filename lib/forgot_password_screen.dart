import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readingappv1/service/api_helper.dart';
import 'package:readingappv1/service/method.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _SignUpScreenState();
}

///TODO : error fix
class _SignUpScreenState extends State<ForgotPasswordScreen> {
  final dio = Dio();
  final TextEditingController _emailController = TextEditingController();
  RxBool isLoading = false.obs;

  int? _password;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  Future<void> forgotPassword() async {
    log('forgotpassword called');
    isLoading.value = true;
    dynamic body = {'userEmail': _emailController.text};
    log('body : $body');

    dynamic response = await ApiHelper.instance.sendHttpRequest(
        urlPath: '/password/forgot',
        method: Method.post,
        body: {
          'userEmail': _emailController.text,
        },
        queryParameters: {
          'userEmail': _emailController.text,
        });
    isLoading.value = false;

    log('forgotpassword : $response');
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
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 40, left: 40),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Нууц үг сэргээх',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'InterTight',
                        fontSize: 24,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Та зөвхөн бүртгэлтэй И-Мейл хаяг оруулна уу',
                    style: TextStyle(
                      fontFamily: 'InterTight',
                    ),
                  ),
                  const SizedBox(height: 160),
                  SizedBox(
                    height: 51,
                    child: TextField(
                      controller: _emailController,
                      style: const TextStyle(
                          color: Color.fromRGBO(0, 124, 214, 0.50)),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email,
                              color: Color.fromRGBO(0, 124, 214, 0.50)),
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide:
                                  BorderSide(color: Colors.lightBlueAccent)),
                          hintText: 'Бүртгэлтэй И-Мейл',
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(0, 124, 214, 0.50))),
                    ),
                  ),
                  const SizedBox(height: 140),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(0, 124, 214, 0.50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {
                        forgotPassword();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2)),
                        child: const Text(
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
        ),
      ),
    );
  }
}
