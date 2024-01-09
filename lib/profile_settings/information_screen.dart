import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  @override
  State<InformationScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<InformationScreen> {
  final dio = Dio();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  String? _firstName;
  String? _lastName;
  int? _phoneNumber;
  int? _password;
  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
  }

  Future<void> updateAccount() async {
    log('saveinformation called');
    dynamic body = {
      "firstName": _firstNameController.text,
      "lastName": _lastNameController.text,
      "email": _emailController.text,
      "phone": _phoneNumberController.text,
    };
    log('body : $body');

    dynamic response = await dio.put(
        'https://speedreaderbackend.azurewebsites.net/api/accounts/update',
        data: body);
    Get.to(() => InformationScreen());
    log('accounts get response : $response');
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
            PhosphorIcons.arrow_left,
            color: Colors.grey,
          ),
        ),
        title: Text(
          'Бүртгэл',
          style: TextStyle(
              fontFamily: 'InterTight',
              fontWeight: FontWeight.w600,
              fontSize: 24,
              fontStyle: FontStyle.normal,
              color: Color.fromRGBO(0, 0, 0, 0.50)),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 32, bottom: 30),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Хувийн Мэдээлэл',
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
                  controller: _firstNameController,
                  style: TextStyle(color: Color.fromRGBO(0, 124, 214, 0.50)),
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        PhosphorIcons.user_circle,
                        color: Color.fromRGBO(0, 0, 0, 0.50),
                      ),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xffE2E8F0),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: Color.fromRGBO(0, 0, 0, 0.50))),
                      hintText: 'Овог',
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(0, 0, 0, 0.50))),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 330,
                height: 51,
                child: TextField(
                  controller: _lastNameController,
                  style: TextStyle(color: Color.fromRGBO(0, 124, 214, 0.50)),
                  decoration: InputDecoration(
                      prefixIcon: Icon(PhosphorIcons.user_circle,
                          color: Color.fromRGBO(0, 0, 0, 0.50)),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xffE2E8F0),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: Color.fromRGBO(0, 0, 0, 0.50))),
                      hintText: 'Нэр',
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(0, 0, 0, 0.50))),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 330,
                height: 51,
                child: TextField(
                  controller: _emailController,
                  style: TextStyle(color: Color.fromRGBO(0, 124, 214, 0.50)),
                  decoration: InputDecoration(
                      prefixIcon: Icon(PhosphorIcons.envelope,
                          color: Color.fromRGBO(0, 0, 0, 0.50)),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xffE2E8F0),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: Color.fromRGBO(0, 0, 0, 0.50))),
                      hintText: 'И-Мейл',
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(0, 0, 0, 0.50))),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 330,
                height: 51,
                child: TextField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(color: Color.fromRGBO(0, 124, 214, 0.50)),
                  decoration: InputDecoration(
                      prefixIcon: Icon(PhosphorIcons.phone,
                          color: Color.fromRGBO(0, 0, 0, 0.50)),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xffE2E8F0),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: Color.fromRGBO(0, 0, 0, 0.50))),
                      hintText: 'Утас',
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(0, 0, 0, 0.50))),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff007CD6),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () {
                    updateAccount();
                  },
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
      ),
    );
  }
}
