import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:get/get.dart';
import 'package:readingappv1/data_controller.dart';
import 'package:readingappv1/profile/profile_avatar.dart';
import 'package:readingappv1/profile_settings/information_screen.dart';
import 'package:readingappv1/service/api_helper.dart';

import '../service/method.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  DataController controller = Get.put(DataController());
  RxBool isLoading = true.obs;

  Future<void> meService() async {
    var (isSuccess, response) = await ApiHelper.instance.sendHttpRequest(
      urlPath: '/api/accounts/get',
      method: Method.get,
    );

    isLoading.value = false;

    if (isSuccess) {
      controller.userData.value = response;
    }
  }

  @override
  Widget build(BuildContext context) {
    meService();

    return Obx(() {
      return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      SizedBox(
                        width: 390,
                        height: 180,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ProfileAvatar(
                              firstName: controller.userData['firstName']
                                  .substring(0, 1),
                              lastName: controller.userData['lastName']
                                  .substring(0, 1),
                            ),
                            const Padding(padding: EdgeInsets.only(top: 10)),
                            Text(
                              '${controller.userData['firstName'].substring(0, 1)}.${controller.userData['lastName']}',
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'InterTight',
                                  fontStyle: FontStyle.normal,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 28.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            textAlign: TextAlign.start,
                            'Хяналтын самбар',
                            style: TextStyle(
                                fontFamily: 'InterTight',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color.fromRGBO(0, 0, 0, 0.50)),
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 16)),
                      InkWell(
                        onTap: () {
                          dynamic data = {
                            'firstName': controller.userData['firstName'],
                            'lastName': controller.userData['lastName'],
                          };

                          Get.to(InformationScreen(data: data));
                        },
                        child: Row(
                          children: [
                            MaterialButton(
                              onPressed: () {},
                              color: const Color(0xffCCE8D6),
                              shape: const CircleBorder(),
                              child: const Icon(
                                PhosphorIcons.user,
                                size: 20,
                                color: Color(0xff008B31),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.toNamed('/information');
                              },
                              child: const Text(
                                'Миний мэдээлэл',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    fontFamily: 'InterTight',
                                    color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          MaterialButton(
                            onPressed: () {
                              Get.toNamed('/privacy');
                            },
                            color: const Color.fromRGBO(0, 0, 0, 0.10),
                            shape: const CircleBorder(),
                            child: const Icon(
                              PhosphorIcons.shield,
                              size: 20,
                              color: Color(0xff505050),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.toNamed('/privacy');
                            },
                            child: const Text(
                              'Нууцлал',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'InterTight',
                                  color: Colors.black),
                            ),
                          )
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 25)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 25.0),
                            child: Text(
                              'Миний хаяг',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                fontFamily: 'InterTight',
                                color: Color.fromRGBO(0, 0, 0, 0.50),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 25.0),
                                child: Text(
                                  'Бүртгэл солих',
                                  style: TextStyle(
                                      fontFamily: 'InterTight',
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.toNamed('/changeacc');
                                },
                                child: const Padding(
                                  padding: EdgeInsets.only(right: 25.0),
                                  child: Text(
                                    'З.Мандуул',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal,
                                        fontFamily: 'InterTight',
                                        color: Color.fromRGBO(0, 0, 0, 0.50)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20),
                            child: Container(
                              height: 1,
                              color: Colors.grey,
                              width: double.infinity,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Get.toNamed('/login');
                                    },
                                    icon: const Icon(PhosphorIcons.sign_out)),
                                TextButton(
                                  onPressed: () {
                                    Get.toNamed('/login');
                                  },
                                  child: const Text(
                                    'Гарах',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontFamily: 'InterTight',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
          ),
        ),
      );
    });
  }
}
