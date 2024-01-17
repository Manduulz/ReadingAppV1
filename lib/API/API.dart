// import 'package:api_provider/api_provider.dart';
// import 'package:dio/dio.dart';
// import 'package:readingappv1/API/dio_provider.dart';
// import 'package:readingappv1/model/base_response.dart';
// import 'package:readingappv1/model/login_response.dart';
// import 'package:readingappv1/persistance/account_persistance.dart';
//
// class LoginRepository {
//   final apiProvider = ApiProvider();
//
//   final _accountPersistance = AccountPersistance();
//
//   Future<BaseResponse<LoginResponse>> authenticate(
//       {required String username, required String password}) async {
//     try {
//       Response response = await apiProvider.tokenDio.post("/api/connect/token",
//           data: {
//             "grant_type": "password",
//             "UserName": username,
//             "Password": password,
//             "client_id": "user",
//             "admin"
//                 "client_secret": "291bf515-3684-4c37-bd1a-59325e76810b",
//             "37f8002c-2206-4182-8278-c2af7b5aa108"
//                 "scope": "offline_access"
//           },
//           options: Options(
//             contentType: Headers.formUrlEncodedContentType,
//           ));
//       final accessToken = 'Bearer${response.data['access_token']}';
//       final refreshToken = response.data['refresh_token'];
//       final firstName = response.data['firstName'];
//       final lastName = response.data['lastName'];
//       final accountId = response.data['accountId'];
//       final roles = response.data['roles'];
//       apiProvider.setRefreshToken(
//           refreshToken: refreshToken, token: accessToken);
//       _accountPersistance.setRefreshToken(refreshToken);
//       _accountPersistance.setFirstName(firstName);
//       _accountPersistance.setLastName(lastName);
//       // _accountPersistance.setAccountId(_getAccountId(accountId) ?? 0);
//       // _accountPersistance.setRoles(roles);
//
//       return SuccessResponse(LoginResponse.fromJson(response.data));
//     } catch (error) {
//       if (error is DioException) {
//         return ErrorResponse.fromDioError(error);
//       }
//       return ErrorResponse(
//           message: 'looks like something has gone wrong! please try again');
//     }
//   }
//
//   Future<bool> authenticateWithToken() async {
//     final refreshtoken = await _accountPersistance.loadRefreshToken();
//     if (refreshtoken == null) {
//       return false;
//     }
//     try {
//       final String token = await apiProvider.getToken(refreshtoken);
//       apiProvider.setRefreshToken(refreshToken: refreshtoken, token: token);
//       return true;
//     } on DioException {
//       return false;
//     }
//   }
//
//   Future<bool> forgotPassword(String email) async {
//     try {
//       await apiProvider.tokenDio.post("/api/authorization/password/forgot",
//           data: {'email': Uri.encodeComponent(email)});
//       return true;
//     } on DioException {
//       return false;
//     }
//   }
// }
