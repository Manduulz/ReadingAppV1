import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';

import 'log_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final dio = Dio();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _birthDayController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _firstName;
  String? _lastName;
  int? _birthDay;
  int? _phoneNumber;
  int? _password;
  String? _email;

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
    log('signup called');
    dynamic body = {
      'id': 0,
      'firstname': _firstNameController.text,
      'lastname': _lastNameController.text,
      'gender': 'Male',
      'email': _emailController.text,
      'phone': _phoneNumberController.text,
      'birthday': _birthDayController.text,
      'status': 'Active',
      'createdDate': _birthDayController.text,
      'schoolId': 0,
      'password': _passwordController.text,
    };
    log('body : $body');

    dynamic response = await dio.post(
        'https://speedreaderbackend.azurewebsites.net/api/accounts/create',
        data: body);
    Get.to(() => LogInScreen());
    log('accounts get response : $response');
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
                'Бүртгүүлэх',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'InterTight',
                    fontSize: 24,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              SizedBox(height: 50),
              SizedBox(
                width: 330,
                height: 51,
                child: TextField(
                  controller: _firstNameController,
                  style: TextStyle(color: Color.fromRGBO(0, 124, 214, 0.50)),
                  decoration: InputDecoration(
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
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(0, 124, 214, 0.50))),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 330,
                height: 51,
                child: TextField(
                  controller: _lastNameController,
                  style: TextStyle(color: Color.fromRGBO(0, 124, 214, 0.50)),
                  decoration: InputDecoration(
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
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(0, 124, 214, 0.50))),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 330,
                height: 51,
                child: TextField(
                  controller: _birthDayController,
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  style: TextStyle(color: Color.fromRGBO(0, 124, 214, 0.50)),
                  decoration: InputDecoration(
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
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(0, 124, 214, 0.50))),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 330,
                height: 51,
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Color.fromRGBO(0, 124, 214, 0.50)),
                  decoration: InputDecoration(
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
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(0, 124, 214, 0.50))),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 330,
                height: 51,
                child: TextField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(color: Color.fromRGBO(0, 124, 214, 0.50)),
                  decoration: InputDecoration(
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
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(0, 124, 214, 0.50))),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 330,
                height: 51,
                child: TextField(
                  obscureText: true,
                  controller: _passwordController,
                  style: TextStyle(color: Color.fromRGBO(0, 124, 214, 0.50)),
                  decoration: InputDecoration(
                      prefixIcon: Icon(PhosphorIcons.key,
                          color: Color.fromRGBO(0, 124, 214, 0.50)),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide:
                              BorderSide(color: Colors.lightBlueAccent)),
                      hintText: 'Нууц Үг Үүсгэх',
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(0, 124, 214, 0.50))),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(0, 124, 214, 0.50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () {
                    signUp();
                  },
                  child: Container(
                    width: 280,
                    height: 50,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(2)),
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
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
      ),
    );
  }
}
