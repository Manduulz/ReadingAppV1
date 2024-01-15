class LoginResponse {
  final int? accountId;
  final String firstName;
  final String lastName;
  final String tokenType;
  final String accessToken;
  final int expiresIn;
  final String refreshToken;

  LoginResponse({
    required this.accountId,
    required this.firstName,
    required this.lastName,
    required this.tokenType,
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
  });
  LoginResponse.fromJson(Map<String, dynamic> json)
      : accountId = int.tryParse(json['accountid']),
        firstName = json['firstName'],
        lastName = json['lastName'],
        tokenType = json['token_type'],
        accessToken = json['access_token'],
        expiresIn = json['expires_in'],
        refreshToken = json['refresh_token'];
}
