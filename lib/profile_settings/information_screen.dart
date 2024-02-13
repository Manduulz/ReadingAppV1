import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:readingappv1/data_controller.dart';
import 'package:readingappv1/service/api_helper.dart';

import '../service/method.dart';

class InformationScreen extends StatefulWidget {
  final dynamic data;
  const InformationScreen({required this.data, super.key});

  @override
  State<InformationScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<InformationScreen> {
  DataController controller = Get.put(DataController());
  RxBool isLoading = true.obs;

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

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
      "id": 20,
      "firstName": _firstNameController.text,
      "lastName": _lastNameController.text,
      "email": _emailController.text,
      "phone": _phoneNumberController.text,
      "status": "Active",
      "schoolId": 0,
    };
    log('body : $body');

    /// TODO : Delete

    var (isSuccess, response) = await ApiHelper.instance.sendHttpRequest(
      urlPath: '/api/accounts/update',
      method: Method.put,
      body: body,
    );

    log('accounts get response : $response , $isSuccess');
  }

  Future<void> getAccount() async {
    var (isSuccess, response) = await ApiHelper.instance.sendHttpRequest(
      urlPath: '/api/accounts/get',
      method: Method.get,
    );
    isLoading.value = false;
    if (isSuccess) {
      setState(() {
        controller.userData.value = response;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    log('data : ${controller.userData['firstName']}');
    log('data : ${controller.userData['lastName']}');

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xffE8EFF5),
        centerTitle: true,

        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(kToolbarHeight),
        //   child: Padding(padding: const EdgeInsets.all(20.0)),
        // ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            PhosphorIcons.arrow_left,
            color: Colors.grey,
          ),
        ),
        title: const Text(
          'Бүртгэл',
          style: TextStyle(
              fontFamily: 'InterTight', fontWeight: FontWeight.w600, fontSize: 24, fontStyle: FontStyle.normal, color: Color.fromRGBO(0, 0, 0, 0.50)),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, left: 32, bottom: 30),
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
                  style: const TextStyle(color: Color.fromRGBO(0, 124, 214, 0.50)),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        PhosphorIcons.user_circle,
                        color: Color.fromRGBO(0, 0, 0, 0.50),
                      ),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: const Color(0xffE2E8F0),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.50))),
                      hintText: controller.userData['firstName'] ?? 'Овог',
                      hintStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.50))),
                ),
              ),
              const SizedBox(height: 30),
              // SizedBox(
              //   width: 330,
              //   height: 51,
              //   child: TextFormField(
              //     controller: _lastNameController,
              //     style:
              //         const TextStyle(color: Color.fromRGBO(0, 124, 214, 0.50)),
              //     decoration: const InputDecoration(
              //         prefixIcon: Icon(PhosphorIcons.user_circle,
              //             color: Color.fromRGBO(0, 0, 0, 0.50)),
              //         border: InputBorder.none,
              //         filled: true,
              //         fillColor: Color(0xffE2E8F0),
              //         enabledBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.all(Radius.circular(10)),
              //             borderSide:
              //                 BorderSide(color: Color.fromRGBO(0, 0, 0, 0.50))),
              //         hintText: 'Нэр',
              //         hintStyle:
              //             TextStyle(color: Color.fromRGBO(0, 0, 0, 0.50))),
              //   ),
              // ),
              SizedBox(
                width: 330,
                height: 51,
                child: TextField(
                  controller: _lastNameController,
                  style: const TextStyle(color: Color.fromRGBO(0, 124, 214, 0.50)),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        PhosphorIcons.user_circle,
                        color: Color.fromRGBO(0, 0, 0, 0.50),
                      ),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: const Color(0xffE2E8F0),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.50))),
                      hintText: controller.userData['lastName'] ?? 'Нэр',
                      hintStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.50))),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 330,
                height: 51,
                child: TextField(
                  controller: _emailController,
                  style: const TextStyle(color: Color.fromRGBO(0, 124, 214, 0.50)),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(PhosphorIcons.envelope, color: Color.fromRGBO(0, 0, 0, 0.50)),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: const Color(0xffE2E8F0),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.50))),
                      hintText: controller.userData['email'] ?? 'И-Мейл',
                      hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.50))),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 330,
                height: 51,
                child: TextField(
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(color: Color.fromRGBO(0, 124, 214, 0.50)),
                  decoration: InputDecoration(
                      prefixIcon: Icon(PhosphorIcons.phone, color: Color.fromRGBO(0, 0, 0, 0.50)),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xffE2E8F0),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.50))),
                      hintText: controller.userData['phone'] ?? 'Утас',
                      hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.50))),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff007CD6), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                  onPressed: () {
                    updateAccount();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 280,
                    height: 50,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
                    child: const Text(
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
