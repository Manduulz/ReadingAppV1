import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:readingappv1/service/api_helper.dart';
import 'package:readingappv1/service/method.dart';
import 'package:readingappv1/service/my_storage.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final dio = Dio();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(right: 45, left: 45),
          child: Column(
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 100),
                    const Text(
                      'Нэвтрэх',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'InterTight',
                          fontWeight: FontWeight.w700),
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
                      height: 50,
                      child: TextField(
                        controller: _emailController..text = "test@test.mn",
                        style: const TextStyle(
                            color: Color.fromRGBO(0, 124, 214, 0.50)),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xffE2E8F0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide:
                                BorderSide(color: Colors.lightBlueAccent),
                          ),
                          hintStyle: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Нууц үг')),
                    const SizedBox(height: 6),
                    SizedBox(
                      height: 50,
                      child: TextField(
                        obscureText: _obscureText,
                        controller: _passwordController..text = "123",
                        style: const TextStyle(
                            color: Color.fromRGBO(0, 124, 214, 0.50)),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xffE2E8F0),
                            enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide:
                                    BorderSide(color: Colors.lightBlueAccent)),
                            hintStyle: const TextStyle(color: Colors.white),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                size: 20,
                                color: Colors.lightBlueAccent,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            )),
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
                            backgroundColor:
                                const Color.fromRGBO(0, 124, 214, 0.50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        onPressed: () => login(),
                        child: Container(
                          alignment: Alignment.center,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2)),
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
        )),
      ),
    );
  }

  Future<void> login() async {
    context.loaderOverlay.show();

    var (isSuccess, response) = await ApiHelper.instance.sendHttpRequest(
      urlPath: '/connect/token',
      contentType: 'application/x-www-form-urlencoded',
      method: Method.post,
      body: {
        "grant_type": "password",
        "username": _emailController.text,
        "password": _passwordController.text,
        "client_secret": "291bf515-3684-4c37-bd1a-59325e76810b",
        "client_id": "user",
      },
      queryParameters: {"scope": "offline_access"},
    ).catchError((error) {
      return (false, null);
    }).onError((error, stackTrace) async {
      return (false, null);
    });

    if (!isSuccess) {
      if (context.mounted) {
        context.loaderOverlay.hide();
      }

      return showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.error(
            message: 'Нэр нууц үг тохирохгүй байна.',
          ),
          displayDuration: const Duration(seconds: 2));
    }

    await MyStorage.instance
        .saveData('token', 'Bearer ${response['access_token']}');

    if (context.mounted) {
      context.loaderOverlay.hide();

      showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.success(
            message: 'Амжилттай нэвтэрлээ.',
          ),
          displayDuration: const Duration(seconds: 2));
    }

    return Get.toNamed('/screenlayout');
  }
}
