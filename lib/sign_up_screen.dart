import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:readingappv1/service/api_helper.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'service/method.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String selectedGender = '';
  final dio = Dio();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _birthDayController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  RxBool isSuccess = RxBool(true);
  bool _obscureTextPass = true;

  Map<String, String> genderMap = {'male': 'Эрэгтэй', 'female': 'Эмэгтэй'};

  Future<void> _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1920),
      lastDate: DateTime(2025),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _birthDayController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> signUp() async {
    context.loaderOverlay.show();

    Map<String, dynamic> body = {
      'id': 20,
      'firstname': _firstNameController.text,
      'lastname': _lastNameController.text,
      'gender': selectedGender.toLowerCase(),
      'email': _emailController.text,
      'phone': _phoneNumberController.text,
      'birthday': _birthDayController.text,
      'status': 'Active',
      'createdDate': _birthDayController.text,
      'schoolId': 0,
      'password': _passwordController.text,
    };

    var (isSuccess, _) = await ApiHelper.instance
        .sendHttpRequest(
      urlPath: '/api/accounts/create',
      method: Method.post,
      body: body,
    )
        .catchError((error) {
      return (false, null);
    }).onError((error, stackTrace) async {
      return (false, null);
    });

    context.loaderOverlay.hide();

    if (!isSuccess) {
      if (context.mounted) {
        context.loaderOverlay.hide();
      }

      return showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.error(
            message: 'Бүртгэл үүсгэхэд алдаа гарлаа.',
          ),
          displayDuration: const Duration(seconds: 2));
    }

    if (context.mounted) {
      context.loaderOverlay.hide();

      showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.success(
            message: 'Бүртгэл амжилттай үүслээ.',
          ),
          displayDuration: const Duration(seconds: 2));
    }

    return Get.toNamed('/login');
  }

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _birthDayController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
  }

  _showGenderPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return SizedBox(
            height: 150,
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    'Эрэгтэй',
                    style: TextStyle(
                      fontFamily: 'InterTight',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color.fromRGBO(0, 124, 214, 0.50),
                    ),
                  ),
                  onTap: () {
                    _setSelectedGender('male');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text(
                    'Эмэгтэй',
                    style: TextStyle(
                      fontFamily: 'InterTight',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Color.fromRGBO(0, 124, 214, 0.50),
                    ),
                  ),
                  onTap: () {
                    _setSelectedGender('female');
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }

  _setSelectedGender(String gender) {
    setState(() {
      selectedGender = gender;
      _genderController.text = genderMap[selectedGender] ?? "";
    });
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
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(right: 45, left: 45),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Бүртгүүлэх',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'InterTight',
                      fontSize: 24,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  height: 51,
                  child: TextField(
                    controller: _firstNameController,
                    keyboardType: TextInputType.name,
                    style: const TextStyle(
                        color: Color.fromRGBO(0, 124, 214, 0.50)),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          PhosphorIcons.user_circle,
                          color: Color.fromRGBO(0, 124, 214, 0.50),
                        ),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.lightBlueAccent)),
                        hintText: 'Овог',
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(0, 124, 214, 0.50))),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 51,
                  child: TextField(
                    controller: _lastNameController,
                    keyboardType: TextInputType.name,
                    style: const TextStyle(
                        color: Color.fromRGBO(0, 124, 214, 0.50)),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(PhosphorIcons.user_circle,
                            color: Color.fromRGBO(0, 124, 214, 0.50)),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.lightBlueAccent)),
                        hintText: 'Нэр',
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(0, 124, 214, 0.50))),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 51,
                  child: TextField(
                    controller: _birthDayController,
                    readOnly: true,
                    onTap: () => _selectDate(context),
                    style: const TextStyle(
                        color: Color.fromRGBO(0, 124, 214, 0.50)),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(PhosphorIcons.calendar_blank,
                            color: Color.fromRGBO(0, 124, 214, 0.50)),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.lightBlueAccent)),
                        hintText: 'Төрсөн Он Сар Өдөр',
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(0, 124, 214, 0.50))),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 51,
                  child: TextField(
                    controller: _genderController,
                    readOnly: true,
                    style: const TextStyle(
                        color: Color.fromRGBO(0, 124, 214, 0.50)),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(PhosphorIcons.user_circle,
                          color: Color.fromRGBO(0, 124, 214, 0.50)),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: Colors.lightBlueAccent)),
                      hintText: 'Хүйс',
                      hintStyle: TextStyle(
                        color: Color.fromRGBO(0, 124, 214, 0.50),
                      ),
                    ),
                    onTap: () {
                      _showGenderPicker(context);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 51,
                  child: TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                        color: Color.fromRGBO(0, 124, 214, 0.50)),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(PhosphorIcons.envelope,
                            color: Color.fromRGBO(0, 124, 214, 0.50)),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.lightBlueAccent)),
                        hintText: 'И-Мейл',
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(0, 124, 214, 0.50))),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 51,
                  child: TextField(
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(
                        color: Color.fromRGBO(0, 124, 214, 0.50)),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(PhosphorIcons.phone,
                            color: Color.fromRGBO(0, 124, 214, 0.50)),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.lightBlueAccent)),
                        hintText: 'Утас',
                        hintStyle: TextStyle(
                            color: Color.fromRGBO(0, 124, 214, 0.50))),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 51,
                  child: TextField(
                    obscureText: _obscureTextPass,
                    controller: _passwordController,
                    style: const TextStyle(
                        color: Color.fromRGBO(0, 124, 214, 0.50)),
                    decoration: InputDecoration(
                        prefixIcon: const Icon(PhosphorIcons.key,
                            color: Color.fromRGBO(0, 124, 214, 0.50)),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.lightBlueAccent)),
                        hintText: 'Нууц Үг Үүсгэх',
                        hintStyle: const TextStyle(
                          color: Color.fromRGBO(0, 124, 214, 0.50),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureTextPass
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 20,
                            color: Colors.lightBlueAccent,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureTextPass = !_obscureTextPass;
                            });
                          },
                        )),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromRGBO(0, 124, 214, 0.50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: () {
                      signUp();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(2)),
                      child: const Text(
                        textAlign: TextAlign.center,
                        'Бүртгэл үүсгэх',
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
        )),
      ),
    );
  }
}
