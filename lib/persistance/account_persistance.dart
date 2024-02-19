import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _refreshKey = "refresh_token";
const _firstNameKey = "first_name";
const _lastNameKey = "last_name";
// const _accountIdKey = "account_id";

class AccountPersistance {
  final _secureStorage = const FlutterSecureStorage();

  Future<String?> loadRefreshToken() =>
      _secureStorage.read(key: _refreshKey).catchError((_) => null);

  Future<void> setRefreshToken(String refreshToken) =>
      _secureStorage.write(key: _refreshKey, value: refreshToken);

  Future<String?> loadFirstName() async {
    final firstName =
        await _secureStorage.read(key: _firstNameKey).catchError((_) => null);
    if (firstName == null) {
      return null;
    }
    return firstName;
  }

  Future<void> setFirstName(String firstName) =>
      _secureStorage.write(key: _firstNameKey, value: firstName);

  Future<String?> loadlastName() async {
    final lastName =
        await _secureStorage.read(key: _lastNameKey).catchError((_) => null);
    if (lastName == null) {
      return null;
    }
    return lastName;
  }

  Future<void> setLastName(String lastName) =>
      _secureStorage.write(key: _lastNameKey, value: lastName);
}
